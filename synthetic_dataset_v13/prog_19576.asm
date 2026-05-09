; DESCRIPTION: Composite: Creates a cyan rectangular region at (320, 145) spanning 62 by 81 pixels then Sets a single purple pixel at (495, 105) then Renders a orange line between points (170, 112) and (96, 83).
; PLAN: r0=320(x), r1=145(y), r2=62(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=495(x), r6=105(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=170(x1), r11=112(y1), r12=96(x2), r13=83(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 320
LDI r1, 145
LDI r2, 62
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 105
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 170
LDI r11, 112
LDI r12, 96
LDI r13, 83
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
