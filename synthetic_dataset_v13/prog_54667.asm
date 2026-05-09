; DESCRIPTION: Places a magenta line segment connecting (287, 32) to (349, 125).
; PLAN: r0=287(x1), r1=32(y1), r2=349(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 32
LDI r2, 349
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
