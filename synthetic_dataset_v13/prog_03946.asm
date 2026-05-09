; DESCRIPTION: Draws a black line from (229, 122) to (313, 87).
; PLAN: r0=229(x1), r1=122(y1), r2=313(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 122
LDI r2, 313
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
