; DESCRIPTION: Draws a white line from (130, 122) to (448, 146).
; PLAN: r0=130(x1), r1=122(y1), r2=448(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 122
LDI r2, 448
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
