; DESCRIPTION: Draws a white line from (492, 142) to (140, 137).
; PLAN: r0=492(x1), r1=142(y1), r2=140(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 142
LDI r2, 140
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
