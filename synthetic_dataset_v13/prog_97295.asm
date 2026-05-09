; DESCRIPTION: Composite: Renders a black line between points (128, 158) and (367, 73) then Draws a purple rectangle at (159, 45) with width 36 and height 56.
; PLAN: r0=128(x1), r1=158(y1), r2=367(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=159(x), r6=45(y), r7=36(width), r8=56(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 158
LDI r2, 367
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 45
LDI r7, 36
LDI r8, 56
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
