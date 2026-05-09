; DESCRIPTION: Places a magenta line segment connecting (18, 21) to (198, 211).
; PLAN: r0=18(x1), r1=21(y1), r2=198(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 21
LDI r2, 198
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
