; DESCRIPTION: Places a green line segment connecting (78, 212) to (391, 52).
; PLAN: r0=78(x1), r1=212(y1), r2=391(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 212
LDI r2, 391
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
