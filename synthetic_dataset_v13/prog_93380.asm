; DESCRIPTION: Composite: Places a blue line segment connecting (222, 134) to (359, 127) then Renders a green disk with center (50, 125) and radius 26.
; PLAN: r0=222(x1), r1=134(y1), r2=359(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=125(y), r7=26(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 222
LDI r1, 134
LDI r2, 359
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 125
LDI r7, 26
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
