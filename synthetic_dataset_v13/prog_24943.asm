; DESCRIPTION: Composite: Places a green line segment connecting (465, 237) to (494, 222) then Creates a yellow rectangular region at (4, 80) spanning 117 by 94 pixels then Sets a single black pixel at (423, 149).
; PLAN: r0=465(x1), r1=237(y1), r2=494(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=4(x), r6=80(y), r7=117(width), r8=94(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=423(x), r11=149(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 465
LDI r1, 237
LDI r2, 494
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 4
LDI r6, 80
LDI r7, 117
LDI r8, 94
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 423
LDI r11, 149
LDI r12, 0x000000
PSET r10, r11, r12
HALT
