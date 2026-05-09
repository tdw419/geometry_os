; DESCRIPTION: Renders a white line between points (396, 146) and (475, 204).
; PLAN: r0=396(x1), r1=146(y1), r2=475(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 146
LDI r2, 475
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
