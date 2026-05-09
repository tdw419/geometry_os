; DESCRIPTION: Composite: Draws a purple line from (478, 201) to (150, 198) then Places a purple circle of radius 37 at center (213, 213).
; PLAN: r0=478(x1), r1=201(y1), r2=150(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=213(x), r6=213(y), r7=37(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 478
LDI r1, 201
LDI r2, 150
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 213
LDI r7, 37
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
