; DESCRIPTION: Draws a black line from (291, 180) to (58, 185).
; PLAN: r0=291(x1), r1=180(y1), r2=58(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 180
LDI r2, 58
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
