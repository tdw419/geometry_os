; DESCRIPTION: Composite: Renders a cyan line between points (365, 16) and (115, 19) then Draws a purple circle centered at (138, 83) with radius 14.
; PLAN: r0=365(x1), r1=16(y1), r2=115(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=83(y), r7=14(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 365
LDI r1, 16
LDI r2, 115
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 83
LDI r7, 14
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
