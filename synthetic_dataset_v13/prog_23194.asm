; DESCRIPTION: Composite: Creates a green rectangular region at (383, 151) spanning 91 by 70 pixels then Draws a magenta line from (5, 246) to (307, 192).
; PLAN: r0=383(x), r1=151(y), r2=91(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=5(x1), r6=246(y1), r7=307(x2), r8=192(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 383
LDI r1, 151
LDI r2, 91
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 246
LDI r7, 307
LDI r8, 192
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
