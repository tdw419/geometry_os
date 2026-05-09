; DESCRIPTION: Places a red line segment connecting (353, 166) to (66, 212).
; PLAN: r0=353(x1), r1=166(y1), r2=66(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 166
LDI r2, 66
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
