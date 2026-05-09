; DESCRIPTION: Composite: Draws a orange line from (65, 131) to (163, 90) then Sets a single white pixel at (363, 62) then Renders a magenta box of size 66x76 starting at (27, 31).
; PLAN: r0=65(x1), r1=131(y1), r2=163(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=62(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=27(x), r11=31(y), r12=66(width), r13=76(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 65
LDI r1, 131
LDI r2, 163
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 62
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 27
LDI r11, 31
LDI r12, 66
LDI r13, 76
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
