; DESCRIPTION: Draws a white line from (342, 10) to (61, 72).
; PLAN: r0=342(x1), r1=10(y1), r2=61(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 10
LDI r2, 61
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
