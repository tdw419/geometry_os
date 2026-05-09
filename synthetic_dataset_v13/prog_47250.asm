; DESCRIPTION: Composite: Creates a orange rectangular region at (385, 37) spanning 24 by 60 pixels then Draws a magenta line from (40, 152) to (510, 67).
; PLAN: r0=385(x), r1=37(y), r2=24(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=40(x1), r6=152(y1), r7=510(x2), r8=67(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 385
LDI r1, 37
LDI r2, 24
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 152
LDI r7, 510
LDI r8, 67
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
