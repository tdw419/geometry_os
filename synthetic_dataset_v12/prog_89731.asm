; DESCRIPTION: Draws a white line from (172, 171) to (325, 4).
; PLAN: r0=172(x1), r1=171(y1), r2=325(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 171
LDI r2, 325
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
