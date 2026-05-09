; DESCRIPTION: Places a yellow line segment connecting (470, 4) to (361, 219).
; PLAN: r0=470(x1), r1=4(y1), r2=361(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 4
LDI r2, 361
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
