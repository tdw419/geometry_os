; DESCRIPTION: Composite: Places a purple line segment connecting (66, 155) to (462, 204) then Draws a cyan circle centered at (214, 49) with radius 15.
; PLAN: r0=66(x1), r1=155(y1), r2=462(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=49(y), r7=15(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 66
LDI r1, 155
LDI r2, 462
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 49
LDI r7, 15
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
