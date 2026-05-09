; DESCRIPTION: Draws a red line from (275, 160) to (51, 46).
; PLAN: r0=275(x1), r1=160(y1), r2=51(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 160
LDI r2, 51
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
