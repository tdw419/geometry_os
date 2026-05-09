; DESCRIPTION: Composite: Renders a black disk with center (77, 242) and radius 13 then Draws a purple line from (133, 68) to (41, 186).
; PLAN: r0=77(x), r1=242(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=133(x1), r6=68(y1), r7=41(x2), r8=186(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 77
LDI r1, 242
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 133
LDI r6, 68
LDI r7, 41
LDI r8, 186
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
