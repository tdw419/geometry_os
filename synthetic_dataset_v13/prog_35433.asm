; DESCRIPTION: Composite: Creates a green rectangular region at (71, 182) spanning 70 by 72 pixels then Places a magenta line segment connecting (483, 145) to (272, 231).
; PLAN: r0=71(x), r1=182(y), r2=70(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=483(x1), r6=145(y1), r7=272(x2), r8=231(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 71
LDI r1, 182
LDI r2, 70
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 145
LDI r7, 272
LDI r8, 231
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
