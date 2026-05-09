; DESCRIPTION: Draws a black line from (98, 115) to (348, 91).
; PLAN: r0=98(x1), r1=115(y1), r2=348(x2), r3=91(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 115
LDI r2, 348
LDI r3, 91
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
