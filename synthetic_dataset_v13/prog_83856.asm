; DESCRIPTION: Composite: Renders a purple disk with center (181, 109) and radius 16 then Draws a purple line from (6, 250) to (179, 253).
; PLAN: r0=181(x), r1=109(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=6(x1), r6=250(y1), r7=179(x2), r8=253(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 181
LDI r1, 109
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 6
LDI r6, 250
LDI r7, 179
LDI r8, 253
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
