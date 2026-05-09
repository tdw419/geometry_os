; DESCRIPTION: Places a magenta line segment connecting (210, 141) to (339, 230).
; PLAN: r0=210(x1), r1=141(y1), r2=339(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 141
LDI r2, 339
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
