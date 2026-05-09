; DESCRIPTION: Places a magenta line segment connecting (76, 132) to (303, 243).
; PLAN: r0=76(x1), r1=132(y1), r2=303(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 132
LDI r2, 303
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
