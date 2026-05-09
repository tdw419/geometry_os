; DESCRIPTION: Composite: Draws a purple line from (198, 28) to (439, 252) then Creates a white rectangular region at (19, 163) spanning 89 by 60 pixels then Sets a single red pixel at (263, 193).
; PLAN: r0=198(x1), r1=28(y1), r2=439(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=19(x), r6=163(y), r7=89(width), r8=60(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=263(x), r11=193(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 198
LDI r1, 28
LDI r2, 439
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 163
LDI r7, 89
LDI r8, 60
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 263
LDI r11, 193
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
