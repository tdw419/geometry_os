; DESCRIPTION: Renders a orange line between points (469, 81) and (154, 134).
; PLAN: r0=469(x1), r1=81(y1), r2=154(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 81
LDI r2, 154
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
