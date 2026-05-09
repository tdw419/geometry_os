; DESCRIPTION: Draws a blue line from (109, 243) to (167, 10).
; PLAN: r0=109(x1), r1=243(y1), r2=167(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 243
LDI r2, 167
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
