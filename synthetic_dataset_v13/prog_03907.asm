; DESCRIPTION: Renders a black line between points (60, 40) and (199, 76).
; PLAN: r0=60(x1), r1=40(y1), r2=199(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 40
LDI r2, 199
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
