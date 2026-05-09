; DESCRIPTION: Draws a white line from (51, 46) to (511, 234).
; PLAN: r0=51(x1), r1=46(y1), r2=511(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 46
LDI r2, 511
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
