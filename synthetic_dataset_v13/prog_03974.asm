; DESCRIPTION: Draws a red line from (481, 164) to (83, 77).
; PLAN: r0=481(x1), r1=164(y1), r2=83(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 164
LDI r2, 83
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
