; DESCRIPTION: Composite: Places a black dot at position (220, 46) then Places a purple circle of radius 73 at center (105, 86) then Draws a blue line from (498, 139) to (398, 170).
; PLAN: r0=220(x), r1=46(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=105(x), r6=86(y), r7=73(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=498(x1), r11=139(y1), r12=398(x2), r13=170(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 220
LDI r1, 46
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 105
LDI r6, 86
LDI r7, 73
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 498
LDI r11, 139
LDI r12, 398
LDI r13, 170
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
