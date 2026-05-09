; DESCRIPTION: Composite: Creates a purple rectangular region at (356, 52) spanning 85 by 30 pixels then Sets a single orange pixel at (247, 199) then Draws a red line from (462, 44) to (188, 152).
; PLAN: r0=356(x), r1=52(y), r2=85(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=247(x), r6=199(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=462(x1), r11=44(y1), r12=188(x2), r13=152(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 52
LDI r2, 85
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 199
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 462
LDI r11, 44
LDI r12, 188
LDI r13, 152
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
