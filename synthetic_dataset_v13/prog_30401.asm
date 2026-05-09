; DESCRIPTION: Composite: Draws a cyan line from (440, 182) to (339, 141) then Places a yellow dot at position (102, 122) then Places a blue circle of radius 22 at center (431, 30).
; PLAN: r0=440(x1), r1=182(y1), r2=339(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=122(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=431(x), r11=30(y), r12=22(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 440
LDI r1, 182
LDI r2, 339
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 122
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 431
LDI r11, 30
LDI r12, 22
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
