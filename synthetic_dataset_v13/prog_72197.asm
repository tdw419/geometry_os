; DESCRIPTION: Draws a black line from (431, 20) to (440, 254).
; PLAN: r0=431(x1), r1=20(y1), r2=440(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 20
LDI r2, 440
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
