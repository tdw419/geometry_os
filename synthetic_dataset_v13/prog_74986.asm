; DESCRIPTION: Composite: Creates a white rectangular region at (303, 17) spanning 83 by 116 pixels then Sets a single purple pixel at (40, 124) then Draws a cyan line from (501, 4) to (279, 97).
; PLAN: r0=303(x), r1=17(y), r2=83(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=40(x), r6=124(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=501(x1), r11=4(y1), r12=279(x2), r13=97(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 17
LDI r2, 83
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 124
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 501
LDI r11, 4
LDI r12, 279
LDI r13, 97
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
