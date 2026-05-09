; DESCRIPTION: Composite: Renders a magenta line between points (269, 242) and (385, 19) then Creates a cyan rectangular region at (325, 118) spanning 97 by 107 pixels then Sets a single black pixel at (340, 88).
; PLAN: r0=269(x1), r1=242(y1), r2=385(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=325(x), r6=118(y), r7=97(width), r8=107(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=340(x), r11=88(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 269
LDI r1, 242
LDI r2, 385
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 118
LDI r7, 97
LDI r8, 107
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 88
LDI r12, 0x000000
PSET r10, r11, r12
HALT
