; DESCRIPTION: Renders a orange line between points (202, 127) and (407, 53).
; PLAN: r0=202(x1), r1=127(y1), r2=407(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 127
LDI r2, 407
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
