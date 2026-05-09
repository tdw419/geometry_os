; DESCRIPTION: Places a magenta line segment connecting (370, 138) to (76, 13).
; PLAN: r0=370(x1), r1=138(y1), r2=76(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 138
LDI r2, 76
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
