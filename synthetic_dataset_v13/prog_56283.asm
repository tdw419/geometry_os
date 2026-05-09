; DESCRIPTION: Places a green line segment connecting (334, 241) to (306, 178).
; PLAN: r0=334(x1), r1=241(y1), r2=306(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 241
LDI r2, 306
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
