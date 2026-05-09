; DESCRIPTION: Renders a white line between points (69, 125) and (409, 194).
; PLAN: r0=69(x1), r1=125(y1), r2=409(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 125
LDI r2, 409
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
