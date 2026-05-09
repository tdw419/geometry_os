; DESCRIPTION: Composite: Draws a red line from (62, 167) to (408, 58) then Creates a magenta rectangular region at (282, 6) spanning 23 by 73 pixels.
; PLAN: r0=62(x1), r1=167(y1), r2=408(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=6(y), r7=23(width), r8=73(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 62
LDI r1, 167
LDI r2, 408
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 6
LDI r7, 23
LDI r8, 73
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
