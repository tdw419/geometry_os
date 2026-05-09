; DESCRIPTION: Composite: Draws a cyan circle centered at (389, 88) with radius 60 then Places a green line segment connecting (119, 224) to (146, 155).
; PLAN: r0=389(x), r1=88(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=119(x1), r6=224(y1), r7=146(x2), r8=155(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 389
LDI r1, 88
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 119
LDI r6, 224
LDI r7, 146
LDI r8, 155
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
