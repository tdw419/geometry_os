; DESCRIPTION: Composite: Creates a red rectangular region at (74, 140) spanning 45 by 26 pixels then Draws a yellow line from (209, 22) to (131, 89).
; PLAN: r0=74(x), r1=140(y), r2=45(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x1), r6=22(y1), r7=131(x2), r8=89(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 74
LDI r1, 140
LDI r2, 45
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 22
LDI r7, 131
LDI r8, 89
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
