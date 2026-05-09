; DESCRIPTION: Places a green line segment connecting (208, 135) to (252, 148).
; PLAN: r0=208(x1), r1=135(y1), r2=252(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 135
LDI r2, 252
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
