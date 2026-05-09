; DESCRIPTION: Composite: Places a magenta dot at position (490, 240) then Creates a magenta rectangular region at (242, 53) spanning 31 by 60 pixels then Draws a orange line from (184, 31) to (336, 211).
; PLAN: r0=490(x), r1=240(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=242(x), r6=53(y), r7=31(width), r8=60(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=184(x1), r11=31(y1), r12=336(x2), r13=211(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 490
LDI r1, 240
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 242
LDI r6, 53
LDI r7, 31
LDI r8, 60
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 31
LDI r12, 336
LDI r13, 211
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
