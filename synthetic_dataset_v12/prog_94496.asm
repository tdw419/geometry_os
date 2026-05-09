; DESCRIPTION: Draws a blue line from (253, 41) to (60, 59).
; PLAN: r0=253(x1), r1=41(y1), r2=60(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 41
LDI r2, 60
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
