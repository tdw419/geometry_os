; DESCRIPTION: Draws a black line from (335, 131) to (120, 53).
; PLAN: r0=335(x1), r1=131(y1), r2=120(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 131
LDI r2, 120
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
