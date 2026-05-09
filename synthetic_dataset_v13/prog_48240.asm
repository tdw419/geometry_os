; DESCRIPTION: Places a green line segment connecting (86, 145) to (220, 68).
; PLAN: r0=86(x1), r1=145(y1), r2=220(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 145
LDI r2, 220
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
