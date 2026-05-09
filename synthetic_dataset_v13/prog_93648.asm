; DESCRIPTION: Composite: Places a cyan dot at position (97, 175) then Draws a purple line from (49, 122) to (374, 168) then Renders a black disk with center (73, 232) and radius 13.
; PLAN: r0=97(x), r1=175(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=49(x1), r6=122(y1), r7=374(x2), r8=168(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=73(x), r11=232(y), r12=13(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 97
LDI r1, 175
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 49
LDI r6, 122
LDI r7, 374
LDI r8, 168
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 232
LDI r12, 13
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
