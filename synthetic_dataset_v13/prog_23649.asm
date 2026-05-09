; DESCRIPTION: Draws a black line from (361, 33) to (247, 89).
; PLAN: r0=361(x1), r1=33(y1), r2=247(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 33
LDI r2, 247
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
