; DESCRIPTION: Composite: Draws a purple line from (20, 81) to (49, 222) then Places a black circle of radius 44 at center (148, 152).
; PLAN: r0=20(x1), r1=81(y1), r2=49(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=152(y), r7=44(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 20
LDI r1, 81
LDI r2, 49
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 152
LDI r7, 44
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
