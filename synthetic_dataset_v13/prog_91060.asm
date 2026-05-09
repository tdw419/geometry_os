; DESCRIPTION: Renders a white line between points (442, 51) and (273, 24).
; PLAN: r0=442(x1), r1=51(y1), r2=273(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 51
LDI r2, 273
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
