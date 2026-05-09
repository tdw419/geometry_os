; DESCRIPTION: Draws a blue line from (247, 85) to (504, 157).
; PLAN: r0=247(x1), r1=85(y1), r2=504(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 85
LDI r2, 504
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
