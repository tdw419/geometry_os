; DESCRIPTION: Composite: Sets a single blue pixel at (411, 245) then Creates a red rectangular region at (244, 139) spanning 42 by 99 pixels then Draws a magenta line from (497, 68) to (120, 152).
; PLAN: r0=411(x), r1=245(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=244(x), r6=139(y), r7=42(width), r8=99(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=497(x1), r11=68(y1), r12=120(x2), r13=152(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 411
LDI r1, 245
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 244
LDI r6, 139
LDI r7, 42
LDI r8, 99
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 497
LDI r11, 68
LDI r12, 120
LDI r13, 152
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
