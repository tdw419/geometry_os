; DESCRIPTION: Composite: Places a orange dot at position (334, 252) then Renders a yellow line between points (310, 176) and (38, 146) then Creates a magenta rectangular region at (264, 28) spanning 101 by 42 pixels.
; PLAN: r0=334(x), r1=252(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=310(x1), r6=176(y1), r7=38(x2), r8=146(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=264(x), r11=28(y), r12=101(width), r13=42(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 334
LDI r1, 252
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 310
LDI r6, 176
LDI r7, 38
LDI r8, 146
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 264
LDI r11, 28
LDI r12, 101
LDI r13, 42
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
