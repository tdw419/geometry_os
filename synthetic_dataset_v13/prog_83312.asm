; DESCRIPTION: Renders a orange line between points (221, 16) and (118, 204).
; PLAN: r0=221(x1), r1=16(y1), r2=118(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 16
LDI r2, 118
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
