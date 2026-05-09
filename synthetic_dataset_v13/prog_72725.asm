; DESCRIPTION: Composite: Places a black circle of radius 13 at center (191, 194) then Renders a purple line between points (2, 26) and (72, 241).
; PLAN: r0=191(x), r1=194(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=2(x1), r6=26(y1), r7=72(x2), r8=241(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 191
LDI r1, 194
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 2
LDI r6, 26
LDI r7, 72
LDI r8, 241
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
