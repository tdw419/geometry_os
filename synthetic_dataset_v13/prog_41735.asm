; DESCRIPTION: Renders a orange line between points (57, 102) and (33, 225).
; PLAN: r0=57(x1), r1=102(y1), r2=33(x2), r3=225(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 102
LDI r2, 33
LDI r3, 225
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
