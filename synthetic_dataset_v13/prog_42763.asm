; DESCRIPTION: Renders a blue line between points (316, 243) and (365, 150).
; PLAN: r0=316(x1), r1=243(y1), r2=365(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 243
LDI r2, 365
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
