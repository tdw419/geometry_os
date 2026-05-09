; DESCRIPTION: Composite: Draws a blue circle centered at (219, 78) with radius 27 then Draws a orange line from (300, 84) to (277, 93).
; PLAN: r0=219(x), r1=78(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=300(x1), r6=84(y1), r7=277(x2), r8=93(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 219
LDI r1, 78
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 300
LDI r6, 84
LDI r7, 277
LDI r8, 93
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
