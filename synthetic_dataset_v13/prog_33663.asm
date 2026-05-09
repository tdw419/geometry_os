; DESCRIPTION: Draws a blue line from (199, 103) to (339, 96).
; PLAN: r0=199(x1), r1=103(y1), r2=339(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 103
LDI r2, 339
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
