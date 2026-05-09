; DESCRIPTION: Places a orange line segment connecting (258, 96) to (391, 246).
; PLAN: r0=258(x1), r1=96(y1), r2=391(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 96
LDI r2, 391
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
