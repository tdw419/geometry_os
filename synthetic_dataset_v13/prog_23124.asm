; DESCRIPTION: Draws a white line from (366, 82) to (399, 180).
; PLAN: r0=366(x1), r1=82(y1), r2=399(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 82
LDI r2, 399
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
