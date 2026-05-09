; DESCRIPTION: Renders a orange line between points (494, 81) and (494, 50).
; PLAN: r0=494(x1), r1=81(y1), r2=494(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 81
LDI r2, 494
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
