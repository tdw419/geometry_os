; DESCRIPTION: Places a black line segment connecting (113, 76) to (132, 234).
; PLAN: r0=113(x1), r1=76(y1), r2=132(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 76
LDI r2, 132
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
