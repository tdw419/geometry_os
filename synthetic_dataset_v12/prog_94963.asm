; DESCRIPTION: Composite: Places a purple line segment connecting (422, 188) to (222, 153) then Places a blue dot at position (262, 43).
; PLAN: r0=422(x1), r1=188(y1), r2=222(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=262(x), r6=43(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 422
LDI r1, 188
LDI r2, 222
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 43
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
