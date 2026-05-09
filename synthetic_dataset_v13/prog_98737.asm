; DESCRIPTION: Draws a white line from (100, 47) to (366, 75).
; PLAN: r0=100(x1), r1=47(y1), r2=366(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 47
LDI r2, 366
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
