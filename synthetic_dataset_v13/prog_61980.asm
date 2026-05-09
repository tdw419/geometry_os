; DESCRIPTION: Renders a white line between points (506, 102) and (296, 69).
; PLAN: r0=506(x1), r1=102(y1), r2=296(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 102
LDI r2, 296
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
