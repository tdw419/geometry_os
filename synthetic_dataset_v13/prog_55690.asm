; DESCRIPTION: Composite: Places a blue line segment connecting (15, 223) to (499, 99) then Draws a cyan circle centered at (442, 88) with radius 21.
; PLAN: r0=15(x1), r1=223(y1), r2=499(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=88(y), r7=21(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 15
LDI r1, 223
LDI r2, 499
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 88
LDI r7, 21
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
