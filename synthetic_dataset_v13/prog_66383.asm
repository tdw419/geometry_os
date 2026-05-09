; DESCRIPTION: Composite: Renders a black box of size 19x69 starting at (277, 0) then Sets a single white pixel at (1, 212) then Draws a purple line from (134, 195) to (185, 78).
; PLAN: r0=277(x), r1=0(y), r2=19(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=1(x), r6=212(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=134(x1), r11=195(y1), r12=185(x2), r13=78(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 0
LDI r2, 19
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 212
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 134
LDI r11, 195
LDI r12, 185
LDI r13, 78
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
