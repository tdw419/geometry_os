; DESCRIPTION: Composite: Renders a orange line between points (350, 99) and (463, 113) then Draws a green circle centered at (152, 135) with radius 55.
; PLAN: r0=350(x1), r1=99(y1), r2=463(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=152(x), r6=135(y), r7=55(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 350
LDI r1, 99
LDI r2, 463
LDI r3, 113
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 135
LDI r7, 55
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
