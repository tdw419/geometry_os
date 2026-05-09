; DESCRIPTION: Composite: Renders a orange line between points (212, 246) and (57, 39) then Sets a single orange pixel at (348, 72) then Creates a orange rectangular region at (75, 33) spanning 63 by 13 pixels.
; PLAN: r0=212(x1), r1=246(y1), r2=57(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=348(x), r6=72(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=75(x), r11=33(y), r12=63(width), r13=13(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 212
LDI r1, 246
LDI r2, 57
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 72
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 75
LDI r11, 33
LDI r12, 63
LDI r13, 13
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
