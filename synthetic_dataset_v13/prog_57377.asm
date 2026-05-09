; DESCRIPTION: Draws a red line from (164, 112) to (285, 53).
; PLAN: r0=164(x1), r1=112(y1), r2=285(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 112
LDI r2, 285
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
