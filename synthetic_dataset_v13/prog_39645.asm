; DESCRIPTION: Draws a white line from (347, 82) to (432, 73).
; PLAN: r0=347(x1), r1=82(y1), r2=432(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 82
LDI r2, 432
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
