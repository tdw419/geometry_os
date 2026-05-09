; DESCRIPTION: Renders a white line between points (69, 20) and (347, 161).
; PLAN: r0=69(x1), r1=20(y1), r2=347(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 20
LDI r2, 347
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
