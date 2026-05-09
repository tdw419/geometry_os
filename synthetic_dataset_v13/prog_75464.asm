; DESCRIPTION: Composite: Places a black circle of radius 13 at center (391, 127) then Draws a blue line from (107, 201) to (214, 170).
; PLAN: r0=391(x), r1=127(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=107(x1), r6=201(y1), r7=214(x2), r8=170(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 391
LDI r1, 127
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 107
LDI r6, 201
LDI r7, 214
LDI r8, 170
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
