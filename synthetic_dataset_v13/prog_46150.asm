; DESCRIPTION: Composite: Renders a red disk with center (262, 155) and radius 66 then Places a magenta line segment connecting (46, 137) to (210, 232).
; PLAN: r0=262(x), r1=155(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=46(x1), r6=137(y1), r7=210(x2), r8=232(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 262
LDI r1, 155
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 46
LDI r6, 137
LDI r7, 210
LDI r8, 232
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
