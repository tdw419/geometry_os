; DESCRIPTION: Places a magenta line segment connecting (205, 220) to (91, 167).
; PLAN: r0=205(x1), r1=220(y1), r2=91(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 220
LDI r2, 91
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
