; DESCRIPTION: Composite: Renders a black disk with center (354, 174) and radius 74 then Draws a purple line from (267, 229) to (456, 205).
; PLAN: r0=354(x), r1=174(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=267(x1), r6=229(y1), r7=456(x2), r8=205(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 354
LDI r1, 174
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 267
LDI r6, 229
LDI r7, 456
LDI r8, 205
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
