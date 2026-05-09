; DESCRIPTION: Composite: Creates a magenta rectangular region at (380, 72) spanning 77 by 47 pixels then Places a yellow line segment connecting (427, 69) to (114, 238).
; PLAN: r0=380(x), r1=72(y), r2=77(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=427(x1), r6=69(y1), r7=114(x2), r8=238(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 380
LDI r1, 72
LDI r2, 77
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 69
LDI r7, 114
LDI r8, 238
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
