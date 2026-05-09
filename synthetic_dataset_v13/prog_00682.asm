; DESCRIPTION: Places a black line segment connecting (234, 96) to (337, 220).
; PLAN: r0=234(x1), r1=96(y1), r2=337(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 96
LDI r2, 337
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
