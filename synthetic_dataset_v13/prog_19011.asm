; DESCRIPTION: Composite: Places a black line segment connecting (6, 211) to (480, 231) then Draws a cyan circle centered at (288, 130) with radius 80.
; PLAN: r0=6(x1), r1=211(y1), r2=480(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=130(y), r7=80(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 6
LDI r1, 211
LDI r2, 480
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 130
LDI r7, 80
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
