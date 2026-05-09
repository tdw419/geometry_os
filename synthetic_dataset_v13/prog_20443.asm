; DESCRIPTION: Draws a white line from (89, 37) to (10, 107).
; PLAN: r0=89(x1), r1=37(y1), r2=10(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 37
LDI r2, 10
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
