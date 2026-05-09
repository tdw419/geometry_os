; DESCRIPTION: Draws a purple line from (8, 243) to (100, 171).
; PLAN: r0=8(x1), r1=243(y1), r2=100(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 243
LDI r2, 100
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
