; DESCRIPTION: Composite: Renders a blue line between points (470, 168) and (208, 106) then Creates a green circular shape at (421, 160) with radius 63.
; PLAN: r0=470(x1), r1=168(y1), r2=208(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=421(x), r6=160(y), r7=63(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 470
LDI r1, 168
LDI r2, 208
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 160
LDI r7, 63
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
