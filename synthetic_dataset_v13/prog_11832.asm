; DESCRIPTION: Composite: Creates a orange rectangular region at (381, 141) spanning 67 by 39 pixels then Renders a red line between points (126, 43) and (137, 27) then Sets a single cyan pixel at (503, 232).
; PLAN: r0=381(x), r1=141(y), r2=67(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=126(x1), r6=43(y1), r7=137(x2), r8=27(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=503(x), r11=232(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 381
LDI r1, 141
LDI r2, 67
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 43
LDI r7, 137
LDI r8, 27
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 503
LDI r11, 232
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
