; DESCRIPTION: Renders a white line between points (135, 195) and (314, 142).
; PLAN: r0=135(x1), r1=195(y1), r2=314(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 195
LDI r2, 314
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
