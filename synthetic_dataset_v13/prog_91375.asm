; DESCRIPTION: Composite: Draws a purple line from (52, 245) to (191, 186) then Places a black circle of radius 12 at center (261, 157).
; PLAN: r0=52(x1), r1=245(y1), r2=191(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=157(y), r7=12(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 52
LDI r1, 245
LDI r2, 191
LDI r3, 186
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 157
LDI r7, 12
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
