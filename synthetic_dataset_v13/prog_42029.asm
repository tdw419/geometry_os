; DESCRIPTION: Places a magenta line segment connecting (436, 40) to (146, 252).
; PLAN: r0=436(x1), r1=40(y1), r2=146(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 40
LDI r2, 146
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
