; DESCRIPTION: Composite: Renders a green disk with center (202, 103) and radius 52 then Draws a purple line from (407, 234) to (253, 58).
; PLAN: r0=202(x), r1=103(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=407(x1), r6=234(y1), r7=253(x2), r8=58(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 103
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 407
LDI r6, 234
LDI r7, 253
LDI r8, 58
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
