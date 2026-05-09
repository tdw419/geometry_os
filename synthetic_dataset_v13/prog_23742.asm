; DESCRIPTION: Composite: Creates a black circular shape at (80, 79) with radius 40 then Renders a red box of size 13x63 starting at (98, 15) then Places a blue line segment connecting (132, 94) to (382, 130).
; PLAN: r0=80(x), r1=79(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x), r6=15(y), r7=13(width), r8=63(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=132(x1), r11=94(y1), r12=382(x2), r13=130(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 80
LDI r1, 79
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 15
LDI r7, 13
LDI r8, 63
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 94
LDI r12, 382
LDI r13, 130
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
