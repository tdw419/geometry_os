; DESCRIPTION: Draws a white line from (289, 200) to (486, 95).
; PLAN: r0=289(x1), r1=200(y1), r2=486(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 200
LDI r2, 486
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
