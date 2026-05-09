; DESCRIPTION: Composite: Renders a magenta disk with center (451, 149) and radius 21 then Places a white line segment connecting (450, 241) to (196, 145).
; PLAN: r0=451(x), r1=149(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=450(x1), r6=241(y1), r7=196(x2), r8=145(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 149
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 450
LDI r6, 241
LDI r7, 196
LDI r8, 145
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
