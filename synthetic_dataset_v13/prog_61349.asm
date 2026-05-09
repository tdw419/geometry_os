; DESCRIPTION: Draws a white line from (459, 146) to (463, 95).
; PLAN: r0=459(x1), r1=146(y1), r2=463(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 146
LDI r2, 463
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
