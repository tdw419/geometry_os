; DESCRIPTION: Draws a white line from (317, 50) to (40, 77).
; PLAN: r0=317(x1), r1=50(y1), r2=40(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 50
LDI r2, 40
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
