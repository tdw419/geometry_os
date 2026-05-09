; DESCRIPTION: Composite: Places a purple 43x56 rectangle at position (99, 80) then Places a red dot at position (403, 153).
; PLAN: r0=99(x), r1=80(y), r2=43(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x), r6=153(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 99
LDI r1, 80
LDI r2, 43
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 153
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
