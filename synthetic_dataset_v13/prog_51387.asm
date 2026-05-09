; DESCRIPTION: Composite: Creates a magenta rectangular region at (377, 22) spanning 90 by 38 pixels then Places a white line segment connecting (307, 225) to (258, 75).
; PLAN: r0=377(x), r1=22(y), r2=90(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=307(x1), r6=225(y1), r7=258(x2), r8=75(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 377
LDI r1, 22
LDI r2, 90
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 225
LDI r7, 258
LDI r8, 75
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
