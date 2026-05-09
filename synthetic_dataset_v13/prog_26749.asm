; DESCRIPTION: Renders a orange line between points (117, 49) and (455, 229).
; PLAN: r0=117(x1), r1=49(y1), r2=455(x2), r3=229(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 49
LDI r2, 455
LDI r3, 229
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
