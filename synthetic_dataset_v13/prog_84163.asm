; DESCRIPTION: Composite: Draws a magenta line from (186, 172) to (325, 100) then Renders a red disk with center (324, 128) and radius 15.
; PLAN: r0=186(x1), r1=172(y1), r2=325(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=128(y), r7=15(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 186
LDI r1, 172
LDI r2, 325
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 128
LDI r7, 15
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
