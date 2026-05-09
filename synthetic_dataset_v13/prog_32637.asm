; DESCRIPTION: Composite: Renders a black box of size 109x56 starting at (280, 192) then Renders a cyan line between points (365, 236) and (141, 135) then Draws a red circle centered at (276, 66) with radius 43.
; PLAN: r0=280(x), r1=192(y), r2=109(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x1), r6=236(y1), r7=141(x2), r8=135(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=276(x), r11=66(y), r12=43(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 280
LDI r1, 192
LDI r2, 109
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 236
LDI r7, 141
LDI r8, 135
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 276
LDI r11, 66
LDI r12, 43
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
