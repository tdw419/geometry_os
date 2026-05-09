; DESCRIPTION: Composite: Creates a orange rectangular region at (116, 28) spanning 96 by 70 pixels then Renders a yellow line between points (448, 132) and (330, 186) then Places a black dot at position (77, 163).
; PLAN: r0=116(x), r1=28(y), r2=96(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=448(x1), r6=132(y1), r7=330(x2), r8=186(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=77(x), r11=163(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 116
LDI r1, 28
LDI r2, 96
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 132
LDI r7, 330
LDI r8, 186
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 77
LDI r11, 163
LDI r12, 0x000000
PSET r10, r11, r12
HALT
