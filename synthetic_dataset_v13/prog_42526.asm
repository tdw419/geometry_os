; DESCRIPTION: Composite: Creates a cyan rectangular region at (357, 237) spanning 93 by 10 pixels then Places a magenta line segment connecting (396, 33) to (212, 1).
; PLAN: r0=357(x), r1=237(y), r2=93(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=396(x1), r6=33(y1), r7=212(x2), r8=1(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 357
LDI r1, 237
LDI r2, 93
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 33
LDI r7, 212
LDI r8, 1
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
