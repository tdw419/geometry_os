; DESCRIPTION: Draws a white line from (70, 118) to (89, 91).
; PLAN: r0=70(x1), r1=118(y1), r2=89(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 118
LDI r2, 89
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
