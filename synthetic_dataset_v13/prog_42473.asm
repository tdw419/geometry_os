; DESCRIPTION: Draws a red line from (67, 131) to (83, 63).
; PLAN: r0=67(x1), r1=131(y1), r2=83(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 131
LDI r2, 83
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
