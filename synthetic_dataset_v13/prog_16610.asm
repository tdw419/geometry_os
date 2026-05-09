; DESCRIPTION: Renders a orange line between points (123, 161) and (368, 151).
; PLAN: r0=123(x1), r1=161(y1), r2=368(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 161
LDI r2, 368
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
