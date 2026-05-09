; DESCRIPTION: Draws a white line from (377, 75) to (74, 75).
; PLAN: r0=377(x1), r1=75(y1), r2=74(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 75
LDI r2, 74
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
