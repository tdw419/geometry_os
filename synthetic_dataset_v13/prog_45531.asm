; DESCRIPTION: Places a green line segment connecting (68, 193) to (357, 95).
; PLAN: r0=68(x1), r1=193(y1), r2=357(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 193
LDI r2, 357
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
