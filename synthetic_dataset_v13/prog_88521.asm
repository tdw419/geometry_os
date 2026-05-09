; DESCRIPTION: Draws a white line from (74, 61) to (385, 233).
; PLAN: r0=74(x1), r1=61(y1), r2=385(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 61
LDI r2, 385
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
