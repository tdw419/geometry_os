; DESCRIPTION: Composite: Places a magenta line segment connecting (280, 193) to (508, 241) then Creates a black rectangular region at (183, 74) spanning 65 by 88 pixels.
; PLAN: r0=280(x1), r1=193(y1), r2=508(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=183(x), r6=74(y), r7=65(width), r8=88(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 193
LDI r2, 508
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 74
LDI r7, 65
LDI r8, 88
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
