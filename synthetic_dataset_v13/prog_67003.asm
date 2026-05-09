; DESCRIPTION: Places a white line segment connecting (202, 252) to (26, 54).
; PLAN: r0=202(x1), r1=252(y1), r2=26(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 252
LDI r2, 26
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
