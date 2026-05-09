; DESCRIPTION: Renders a orange line between points (271, 115) and (206, 204).
; PLAN: r0=271(x1), r1=115(y1), r2=206(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 115
LDI r2, 206
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
