; DESCRIPTION: Composite: Creates a cyan rectangular region at (121, 156) spanning 22 by 57 pixels then Places a magenta line segment connecting (453, 190) to (215, 168).
; PLAN: r0=121(x), r1=156(y), r2=22(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=453(x1), r6=190(y1), r7=215(x2), r8=168(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 121
LDI r1, 156
LDI r2, 22
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 190
LDI r7, 215
LDI r8, 168
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
