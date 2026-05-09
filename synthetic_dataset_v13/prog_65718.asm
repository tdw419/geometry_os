; DESCRIPTION: Renders a white line between points (68, 49) and (400, 230).
; PLAN: r0=68(x1), r1=49(y1), r2=400(x2), r3=230(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 49
LDI r2, 400
LDI r3, 230
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
