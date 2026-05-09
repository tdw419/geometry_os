; DESCRIPTION: Renders a white line between points (508, 148) and (160, 30).
; PLAN: r0=508(x1), r1=148(y1), r2=160(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 148
LDI r2, 160
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
