; DESCRIPTION: Places a magenta line segment connecting (160, 197) to (219, 30).
; PLAN: r0=160(x1), r1=197(y1), r2=219(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 197
LDI r2, 219
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
