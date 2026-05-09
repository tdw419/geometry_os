; DESCRIPTION: Places a green line segment connecting (329, 252) to (161, 153).
; PLAN: r0=329(x1), r1=252(y1), r2=161(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 252
LDI r2, 161
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
