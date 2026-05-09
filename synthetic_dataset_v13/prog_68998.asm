; DESCRIPTION: Draws a black line from (368, 87) to (289, 22).
; PLAN: r0=368(x1), r1=87(y1), r2=289(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 87
LDI r2, 289
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
