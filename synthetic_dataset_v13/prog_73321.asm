; DESCRIPTION: Composite: Creates a cyan rectangular region at (166, 47) spanning 79 by 72 pixels then Sets a single blue pixel at (268, 219) then Renders a red line between points (325, 31) and (52, 66).
; PLAN: r0=166(x), r1=47(y), r2=79(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=268(x), r6=219(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=325(x1), r11=31(y1), r12=52(x2), r13=66(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 47
LDI r2, 79
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 219
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 325
LDI r11, 31
LDI r12, 52
LDI r13, 66
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
