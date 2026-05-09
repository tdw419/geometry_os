; DESCRIPTION: Composite: Draws a green line from (376, 132) to (236, 233) then Creates a red rectangular region at (77, 154) spanning 31 by 73 pixels then Sets a single white pixel at (339, 219).
; PLAN: r0=376(x1), r1=132(y1), r2=236(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=77(x), r6=154(y), r7=31(width), r8=73(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=339(x), r11=219(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 376
LDI r1, 132
LDI r2, 236
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 154
LDI r7, 31
LDI r8, 73
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 339
LDI r11, 219
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
