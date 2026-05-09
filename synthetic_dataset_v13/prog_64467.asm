; DESCRIPTION: Composite: Creates a cyan rectangular region at (439, 21) spanning 57 by 102 pixels then Draws a blue line from (236, 241) to (485, 183) then Sets a single cyan pixel at (244, 106).
; PLAN: r0=439(x), r1=21(y), r2=57(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x1), r6=241(y1), r7=485(x2), r8=183(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=244(x), r11=106(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 439
LDI r1, 21
LDI r2, 57
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 241
LDI r7, 485
LDI r8, 183
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 106
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
