; DESCRIPTION: Composite: Sets a single white pixel at (176, 186) then Renders a orange line between points (266, 195) and (180, 126) then Draws a black rectangle at (232, 10) with width 28 and height 73.
; PLAN: r0=176(x), r1=186(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=266(x1), r6=195(y1), r7=180(x2), r8=126(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=232(x), r11=10(y), r12=28(width), r13=73(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 176
LDI r1, 186
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 266
LDI r6, 195
LDI r7, 180
LDI r8, 126
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 232
LDI r11, 10
LDI r12, 28
LDI r13, 73
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
