; DESCRIPTION: Draws a white line from (130, 115) to (158, 84).
; PLAN: r0=130(x1), r1=115(y1), r2=158(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 115
LDI r2, 158
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
