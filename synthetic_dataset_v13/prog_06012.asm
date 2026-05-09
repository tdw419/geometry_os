; DESCRIPTION: Draws a black line from (249, 92) to (461, 166).
; PLAN: r0=249(x1), r1=92(y1), r2=461(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 92
LDI r2, 461
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
