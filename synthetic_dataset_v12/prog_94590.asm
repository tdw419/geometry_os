; DESCRIPTION: Renders a white line between points (337, 165) and (451, 98).
; PLAN: r0=337(x1), r1=165(y1), r2=451(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 165
LDI r2, 451
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
