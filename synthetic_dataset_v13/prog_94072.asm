; DESCRIPTION: Places a blue line segment connecting (156, 125) to (395, 91).
; PLAN: r0=156(x1), r1=125(y1), r2=395(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 125
LDI r2, 395
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
