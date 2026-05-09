; DESCRIPTION: Composite: Places a green line segment connecting (173, 117) to (132, 36) then Renders a blue disk with center (214, 145) and radius 45.
; PLAN: r0=173(x1), r1=117(y1), r2=132(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=145(y), r7=45(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 173
LDI r1, 117
LDI r2, 132
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 145
LDI r7, 45
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
