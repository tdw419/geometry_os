; DESCRIPTION: Composite: Creates a orange rectangular region at (376, 91) spanning 113 by 56 pixels then Draws a magenta line from (152, 192) to (360, 93).
; PLAN: r0=376(x), r1=91(y), r2=113(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=152(x1), r6=192(y1), r7=360(x2), r8=93(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 376
LDI r1, 91
LDI r2, 113
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 192
LDI r7, 360
LDI r8, 93
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
