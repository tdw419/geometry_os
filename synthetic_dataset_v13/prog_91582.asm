; DESCRIPTION: Places a black line segment connecting (412, 189) to (234, 206).
; PLAN: r0=412(x1), r1=189(y1), r2=234(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 189
LDI r2, 234
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
