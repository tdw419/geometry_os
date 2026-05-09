; DESCRIPTION: Renders a white line between points (359, 216) and (372, 220).
; PLAN: r0=359(x1), r1=216(y1), r2=372(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 216
LDI r2, 372
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
