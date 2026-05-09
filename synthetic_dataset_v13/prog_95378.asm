; DESCRIPTION: Composite: Places a green line segment connecting (6, 7) to (149, 72) then Creates a magenta rectangular region at (268, 106) spanning 108 by 96 pixels.
; PLAN: r0=6(x1), r1=7(y1), r2=149(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=268(x), r6=106(y), r7=108(width), r8=96(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 6
LDI r1, 7
LDI r2, 149
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 106
LDI r7, 108
LDI r8, 96
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
