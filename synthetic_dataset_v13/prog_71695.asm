; DESCRIPTION: Draws a white line from (411, 22) to (150, 233).
; PLAN: r0=411(x1), r1=22(y1), r2=150(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 22
LDI r2, 150
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
