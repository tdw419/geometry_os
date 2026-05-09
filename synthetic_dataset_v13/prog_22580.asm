; DESCRIPTION: Places a green line segment connecting (68, 23) to (120, 23).
; PLAN: r0=68(x1), r1=23(y1), r2=120(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 23
LDI r2, 120
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
