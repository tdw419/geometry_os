; DESCRIPTION: Draws a white line from (143, 5) to (3, 77).
; PLAN: r0=143(x1), r1=5(y1), r2=3(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 5
LDI r2, 3
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
