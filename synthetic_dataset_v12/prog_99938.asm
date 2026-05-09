; DESCRIPTION: Places a black line segment connecting (181, 215) to (191, 181).
; PLAN: r0=181(x1), r1=215(y1), r2=191(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 215
LDI r2, 191
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
