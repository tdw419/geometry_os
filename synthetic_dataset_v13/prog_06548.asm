; DESCRIPTION: Composite: Places a cyan line segment connecting (3, 134) to (419, 25) then Draws a purple circle centered at (351, 88) with radius 50.
; PLAN: r0=3(x1), r1=134(y1), r2=419(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=351(x), r6=88(y), r7=50(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 3
LDI r1, 134
LDI r2, 419
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 88
LDI r7, 50
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
