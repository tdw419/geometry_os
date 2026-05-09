; DESCRIPTION: Draws a white line from (70, 77) to (260, 89).
; PLAN: r0=70(x1), r1=77(y1), r2=260(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 77
LDI r2, 260
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
