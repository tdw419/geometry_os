; DESCRIPTION: Composite: Draws a purple line from (326, 156) to (44, 19) then Places a blue circle of radius 19 at center (65, 37).
; PLAN: r0=326(x1), r1=156(y1), r2=44(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=37(y), r7=19(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 326
LDI r1, 156
LDI r2, 44
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 37
LDI r7, 19
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
