; DESCRIPTION: Composite: Creates a white rectangular region at (254, 64) spanning 82 by 70 pixels then Draws a magenta line from (155, 58) to (405, 36).
; PLAN: r0=254(x), r1=64(y), r2=82(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=155(x1), r6=58(y1), r7=405(x2), r8=36(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 64
LDI r2, 82
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 58
LDI r7, 405
LDI r8, 36
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
