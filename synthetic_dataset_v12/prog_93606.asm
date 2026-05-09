; DESCRIPTION: Composite: Draws a blue line from (109, 150) to (103, 218) then Creates a purple rectangular region at (239, 132) spanning 25 by 78 pixels then Sets a single green pixel at (460, 15).
; PLAN: r0=109(x1), r1=150(y1), r2=103(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=132(y), r7=25(width), r8=78(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=460(x), r11=15(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 109
LDI r1, 150
LDI r2, 103
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 132
LDI r7, 25
LDI r8, 78
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 460
LDI r11, 15
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
