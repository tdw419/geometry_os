; DESCRIPTION: Places a magenta line segment connecting (319, 85) to (370, 125).
; PLAN: r0=319(x1), r1=85(y1), r2=370(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 85
LDI r2, 370
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
