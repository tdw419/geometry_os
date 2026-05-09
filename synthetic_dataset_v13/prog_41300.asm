; DESCRIPTION: Draws a black line from (204, 64) to (28, 51).
; PLAN: r0=204(x1), r1=64(y1), r2=28(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 64
LDI r2, 28
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
