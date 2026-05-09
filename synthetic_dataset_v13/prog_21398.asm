; DESCRIPTION: Renders a white line between points (321, 69) and (164, 232).
; PLAN: r0=321(x1), r1=69(y1), r2=164(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 69
LDI r2, 164
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
