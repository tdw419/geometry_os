; DESCRIPTION: Places a orange line segment connecting (279, 177) to (296, 40).
; PLAN: r0=279(x1), r1=177(y1), r2=296(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 177
LDI r2, 296
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
