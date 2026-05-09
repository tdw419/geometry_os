; DESCRIPTION: Composite: Creates a purple rectangular region at (275, 212) spanning 107 by 24 pixels then Places a yellow line segment connecting (258, 226) to (383, 17).
; PLAN: r0=275(x), r1=212(y), r2=107(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x1), r6=226(y1), r7=383(x2), r8=17(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 212
LDI r2, 107
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 226
LDI r7, 383
LDI r8, 17
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
