; DESCRIPTION: Places a magenta line segment connecting (57, 186) to (198, 219).
; PLAN: r0=57(x1), r1=186(y1), r2=198(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 186
LDI r2, 198
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
