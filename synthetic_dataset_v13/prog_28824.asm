; DESCRIPTION: Draws a black line from (495, 191) to (331, 165).
; PLAN: r0=495(x1), r1=191(y1), r2=331(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 191
LDI r2, 331
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
