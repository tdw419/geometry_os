; DESCRIPTION: Composite: Sets a single cyan pixel at (126, 144) then Creates a blue rectangular region at (100, 79) spanning 41 by 58 pixels then Draws a purple line from (293, 149) to (282, 30).
; PLAN: r0=126(x), r1=144(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=100(x), r6=79(y), r7=41(width), r8=58(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=293(x1), r11=149(y1), r12=282(x2), r13=30(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 126
LDI r1, 144
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 100
LDI r6, 79
LDI r7, 41
LDI r8, 58
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 149
LDI r12, 282
LDI r13, 30
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
