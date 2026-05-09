; DESCRIPTION: Renders a green line between points (454, 216) and (415, 74).
; PLAN: r0=454(x1), r1=216(y1), r2=415(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 216
LDI r2, 415
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
