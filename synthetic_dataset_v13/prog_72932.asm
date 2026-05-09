; DESCRIPTION: Composite: Sets a single magenta pixel at (292, 126) then Draws a cyan line from (440, 106) to (436, 198) then Creates a purple rectangular region at (233, 105) spanning 63 by 41 pixels.
; PLAN: r0=292(x), r1=126(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=440(x1), r6=106(y1), r7=436(x2), r8=198(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=233(x), r11=105(y), r12=63(width), r13=41(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 292
LDI r1, 126
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 440
LDI r6, 106
LDI r7, 436
LDI r8, 198
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 105
LDI r12, 63
LDI r13, 41
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
