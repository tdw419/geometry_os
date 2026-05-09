; DESCRIPTION: Draws a black line from (144, 70) to (289, 153).
; PLAN: r0=144(x1), r1=70(y1), r2=289(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 70
LDI r2, 289
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
