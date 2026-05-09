; DESCRIPTION: Composite: Renders a orange line between points (152, 250) and (171, 62) then Draws a blue circle centered at (426, 91) with radius 75.
; PLAN: r0=152(x1), r1=250(y1), r2=171(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=426(x), r6=91(y), r7=75(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 152
LDI r1, 250
LDI r2, 171
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 91
LDI r7, 75
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
