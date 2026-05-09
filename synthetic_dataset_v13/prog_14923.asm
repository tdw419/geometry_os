; DESCRIPTION: Composite: Draws a green circle centered at (144, 83) with radius 71 then Renders a orange line between points (426, 88) and (267, 152).
; PLAN: r0=144(x), r1=83(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=426(x1), r6=88(y1), r7=267(x2), r8=152(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 144
LDI r1, 83
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 426
LDI r6, 88
LDI r7, 267
LDI r8, 152
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
