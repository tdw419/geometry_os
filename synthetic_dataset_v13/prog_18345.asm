; DESCRIPTION: Composite: Places a magenta line segment connecting (249, 90) to (350, 137) then Renders a orange disk with center (57, 181) and radius 50.
; PLAN: r0=249(x1), r1=90(y1), r2=350(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=57(x), r6=181(y), r7=50(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 249
LDI r1, 90
LDI r2, 350
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 181
LDI r7, 50
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
