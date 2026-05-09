; DESCRIPTION: Composite: Creates a orange rectangular region at (195, 174) spanning 23 by 19 pixels then Places a red line segment connecting (251, 197) to (158, 87).
; PLAN: r0=195(x), r1=174(y), r2=23(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=251(x1), r6=197(y1), r7=158(x2), r8=87(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 195
LDI r1, 174
LDI r2, 23
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 197
LDI r7, 158
LDI r8, 87
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
