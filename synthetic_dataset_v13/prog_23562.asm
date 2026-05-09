; DESCRIPTION: Draws a magenta line from (198, 251) to (366, 88).
; PLAN: r0=198(x1), r1=251(y1), r2=366(x2), r3=88(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 251
LDI r2, 366
LDI r3, 88
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
