; DESCRIPTION: Places a magenta line segment connecting (230, 223) to (115, 244).
; PLAN: r0=230(x1), r1=223(y1), r2=115(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 223
LDI r2, 115
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
