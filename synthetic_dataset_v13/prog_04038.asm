; DESCRIPTION: Draws a black line from (77, 72) to (85, 13).
; PLAN: r0=77(x1), r1=72(y1), r2=85(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 72
LDI r2, 85
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
