; DESCRIPTION: Composite: Renders a purple line between points (9, 126) and (392, 131) then Creates a purple rectangular region at (345, 21) spanning 84 by 94 pixels then Sets a single black pixel at (55, 127).
; PLAN: r0=9(x1), r1=126(y1), r2=392(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=21(y), r7=84(width), r8=94(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=55(x), r11=127(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 9
LDI r1, 126
LDI r2, 392
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 21
LDI r7, 84
LDI r8, 94
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 127
LDI r12, 0x000000
PSET r10, r11, r12
HALT
