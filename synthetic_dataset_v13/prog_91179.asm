; DESCRIPTION: Places a magenta line segment connecting (239, 89) to (220, 9).
; PLAN: r0=239(x1), r1=89(y1), r2=220(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 89
LDI r2, 220
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
