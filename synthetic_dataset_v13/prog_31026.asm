; DESCRIPTION: Composite: Places a red 39x80 rectangle at position (450, 169) then Places a purple dot at position (157, 218).
; PLAN: r0=450(x), r1=169(y), r2=39(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=157(x), r6=218(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 450
LDI r1, 169
LDI r2, 39
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 218
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
