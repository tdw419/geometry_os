; DESCRIPTION: Composite: Places a red dot at position (409, 172) then Renders a white line between points (215, 52) and (118, 199) then Draws a magenta rectangle at (366, 47) with width 68 and height 99.
; PLAN: r0=409(x), r1=172(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=215(x1), r6=52(y1), r7=118(x2), r8=199(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=366(x), r11=47(y), r12=68(width), r13=99(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 172
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 215
LDI r6, 52
LDI r7, 118
LDI r8, 199
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 366
LDI r11, 47
LDI r12, 68
LDI r13, 99
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
