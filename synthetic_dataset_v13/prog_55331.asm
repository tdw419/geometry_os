; DESCRIPTION: Draws a blue line from (123, 41) to (93, 64).
; PLAN: r0=123(x1), r1=41(y1), r2=93(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 41
LDI r2, 93
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
