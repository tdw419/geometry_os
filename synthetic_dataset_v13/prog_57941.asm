; DESCRIPTION: Draws a black line from (171, 56) to (79, 88).
; PLAN: r0=171(x1), r1=56(y1), r2=79(x2), r3=88(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 56
LDI r2, 79
LDI r3, 88
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
