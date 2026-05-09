; DESCRIPTION: Draws a white line from (381, 35) to (130, 96).
; PLAN: r0=381(x1), r1=35(y1), r2=130(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 35
LDI r2, 130
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
