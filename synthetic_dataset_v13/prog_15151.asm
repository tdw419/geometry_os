; DESCRIPTION: Renders a white line between points (385, 26) and (230, 237).
; PLAN: r0=385(x1), r1=26(y1), r2=230(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 26
LDI r2, 230
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
