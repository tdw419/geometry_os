; DESCRIPTION: Composite: Draws a yellow line from (202, 191) to (19, 25) then Sets a single white pixel at (121, 46) then Places a blue circle of radius 55 at center (197, 130).
; PLAN: r0=202(x1), r1=191(y1), r2=19(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=121(x), r6=46(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=197(x), r11=130(y), r12=55(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 202
LDI r1, 191
LDI r2, 19
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 46
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 197
LDI r11, 130
LDI r12, 55
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
