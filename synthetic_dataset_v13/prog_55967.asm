; DESCRIPTION: Composite: Sets a single green pixel at (252, 149) then Renders a magenta line between points (311, 23) and (511, 215) then Draws a red rectangle at (115, 132) with width 88 and height 84.
; PLAN: r0=252(x), r1=149(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=311(x1), r6=23(y1), r7=511(x2), r8=215(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=115(x), r11=132(y), r12=88(width), r13=84(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 252
LDI r1, 149
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 311
LDI r6, 23
LDI r7, 511
LDI r8, 215
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 115
LDI r11, 132
LDI r12, 88
LDI r13, 84
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
