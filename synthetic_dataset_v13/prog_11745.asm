; DESCRIPTION: Renders a orange line between points (202, 121) and (334, 139).
; PLAN: r0=202(x1), r1=121(y1), r2=334(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 121
LDI r2, 334
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
