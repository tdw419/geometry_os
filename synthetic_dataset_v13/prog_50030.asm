; DESCRIPTION: Places a magenta line segment connecting (230, 184) to (16, 202).
; PLAN: r0=230(x1), r1=184(y1), r2=16(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 184
LDI r2, 16
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
