; DESCRIPTION: Draws a red line from (463, 75) to (425, 18).
; PLAN: r0=463(x1), r1=75(y1), r2=425(x2), r3=18(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 75
LDI r2, 425
LDI r3, 18
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
