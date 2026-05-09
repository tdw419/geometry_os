; DESCRIPTION: Places a magenta line segment connecting (368, 22) to (120, 230).
; PLAN: r0=368(x1), r1=22(y1), r2=120(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 22
LDI r2, 120
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
