; DESCRIPTION: Renders a orange line between points (313, 117) and (168, 200).
; PLAN: r0=313(x1), r1=117(y1), r2=168(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 117
LDI r2, 168
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
