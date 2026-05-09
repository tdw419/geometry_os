; DESCRIPTION: Composite: Places a purple line segment connecting (459, 67) to (452, 65) then Places a magenta circle of radius 18 at center (472, 194) then Places a red dot at position (98, 188).
; PLAN: r0=459(x1), r1=67(y1), r2=452(x2), r3=65(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=472(x), r6=194(y), r7=18(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=98(x), r11=188(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 459
LDI r1, 67
LDI r2, 452
LDI r3, 65
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 194
LDI r7, 18
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 98
LDI r11, 188
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
