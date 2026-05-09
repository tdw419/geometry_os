; DESCRIPTION: Renders a orange line between points (368, 134) and (65, 60).
; PLAN: r0=368(x1), r1=134(y1), r2=65(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 134
LDI r2, 65
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
