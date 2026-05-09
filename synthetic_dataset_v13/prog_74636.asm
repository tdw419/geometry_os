; DESCRIPTION: Composite: Sets a single purple pixel at (338, 49) then Renders a green box of size 12x18 starting at (171, 25) then Draws a magenta line from (141, 167) to (62, 6).
; PLAN: r0=338(x), r1=49(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=171(x), r6=25(y), r7=12(width), r8=18(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=141(x1), r11=167(y1), r12=62(x2), r13=6(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 338
LDI r1, 49
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 171
LDI r6, 25
LDI r7, 12
LDI r8, 18
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 141
LDI r11, 167
LDI r12, 62
LDI r13, 6
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
