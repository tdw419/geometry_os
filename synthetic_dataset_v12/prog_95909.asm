; DESCRIPTION: Draws a red line from (103, 38) to (399, 70).
; PLAN: r0=103(x1), r1=38(y1), r2=399(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 38
LDI r2, 399
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
