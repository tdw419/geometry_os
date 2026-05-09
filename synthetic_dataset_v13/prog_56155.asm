; DESCRIPTION: Composite: Places a purple 120x99 rectangle at position (29, 120) then Places a white dot at position (387, 128).
; PLAN: r0=29(x), r1=120(y), r2=120(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=387(x), r6=128(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 29
LDI r1, 120
LDI r2, 120
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 128
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
