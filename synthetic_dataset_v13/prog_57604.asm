; DESCRIPTION: Places a magenta line segment connecting (470, 165) to (287, 182).
; PLAN: r0=470(x1), r1=165(y1), r2=287(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 165
LDI r2, 287
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
