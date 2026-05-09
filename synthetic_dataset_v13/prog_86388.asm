; DESCRIPTION: Places a green line segment connecting (174, 2) to (252, 30).
; PLAN: r0=174(x1), r1=2(y1), r2=252(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 2
LDI r2, 252
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
