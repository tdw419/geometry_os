; DESCRIPTION: Places a black line segment connecting (392, 198) to (234, 72).
; PLAN: r0=392(x1), r1=198(y1), r2=234(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 198
LDI r2, 234
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
