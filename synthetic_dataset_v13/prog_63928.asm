; DESCRIPTION: Composite: Creates a purple rectangular region at (101, 24) spanning 81 by 13 pixels then Places a orange line segment connecting (269, 26) to (213, 227) then Places a cyan dot at position (357, 79).
; PLAN: r0=101(x), r1=24(y), r2=81(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=269(x1), r6=26(y1), r7=213(x2), r8=227(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=357(x), r11=79(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 101
LDI r1, 24
LDI r2, 81
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 26
LDI r7, 213
LDI r8, 227
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 357
LDI r11, 79
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
