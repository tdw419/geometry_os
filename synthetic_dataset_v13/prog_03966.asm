; DESCRIPTION: Renders a white line between points (89, 79) and (482, 237).
; PLAN: r0=89(x1), r1=79(y1), r2=482(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 79
LDI r2, 482
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
