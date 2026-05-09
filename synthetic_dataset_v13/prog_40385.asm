; DESCRIPTION: Renders a white line between points (230, 212) and (350, 124).
; PLAN: r0=230(x1), r1=212(y1), r2=350(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 212
LDI r2, 350
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
