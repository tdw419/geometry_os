; DESCRIPTION: Renders a orange line between points (215, 24) and (81, 4).
; PLAN: r0=215(x1), r1=24(y1), r2=81(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 24
LDI r2, 81
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
