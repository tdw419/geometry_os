; DESCRIPTION: Composite: Creates a green rectangular region at (322, 67) spanning 34 by 87 pixels then Draws a magenta line from (437, 86) to (211, 28).
; PLAN: r0=322(x), r1=67(y), r2=34(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=437(x1), r6=86(y1), r7=211(x2), r8=28(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 67
LDI r2, 34
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 86
LDI r7, 211
LDI r8, 28
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
