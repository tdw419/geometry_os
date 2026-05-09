; DESCRIPTION: Draws a black line from (14, 202) to (461, 64).
; PLAN: r0=14(x1), r1=202(y1), r2=461(x2), r3=64(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 202
LDI r2, 461
LDI r3, 64
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
