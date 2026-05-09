; DESCRIPTION: Composite: Draws a purple line from (311, 213) to (129, 145) then Renders a yellow disk with center (156, 172) and radius 12.
; PLAN: r0=311(x1), r1=213(y1), r2=129(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=156(x), r6=172(y), r7=12(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 311
LDI r1, 213
LDI r2, 129
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 172
LDI r7, 12
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
