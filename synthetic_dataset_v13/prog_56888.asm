; DESCRIPTION: Renders a orange line between points (330, 135) and (297, 43).
; PLAN: r0=330(x1), r1=135(y1), r2=297(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 135
LDI r2, 297
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
