; DESCRIPTION: Composite: Creates a purple rectangular region at (241, 120) spanning 84 by 102 pixels then Draws a purple line from (109, 115) to (367, 132).
; PLAN: r0=241(x), r1=120(y), r2=84(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=109(x1), r6=115(y1), r7=367(x2), r8=132(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 120
LDI r2, 84
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 115
LDI r7, 367
LDI r8, 132
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
