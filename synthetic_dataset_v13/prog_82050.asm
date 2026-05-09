; DESCRIPTION: Renders a orange line between points (492, 204) and (36, 117).
; PLAN: r0=492(x1), r1=204(y1), r2=36(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 204
LDI r2, 36
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
