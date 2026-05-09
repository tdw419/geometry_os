; DESCRIPTION: Renders a black line between points (375, 119) and (502, 31).
; PLAN: r0=375(x1), r1=119(y1), r2=502(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 119
LDI r2, 502
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
