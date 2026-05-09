; DESCRIPTION: Composite: Draws a magenta line from (400, 80) to (50, 15) then Renders a blue disk with center (328, 149) and radius 53.
; PLAN: r0=400(x1), r1=80(y1), r2=50(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=328(x), r6=149(y), r7=53(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 400
LDI r1, 80
LDI r2, 50
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 149
LDI r7, 53
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
