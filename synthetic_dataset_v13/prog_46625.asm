; DESCRIPTION: Composite: Places a magenta circle of radius 65 at center (202, 95) then Places a purple dot at position (430, 204) then Draws a purple line from (35, 40) to (61, 69).
; PLAN: r0=202(x), r1=95(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=430(x), r6=204(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=35(x1), r11=40(y1), r12=61(x2), r13=69(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 202
LDI r1, 95
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 430
LDI r6, 204
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 35
LDI r11, 40
LDI r12, 61
LDI r13, 69
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
