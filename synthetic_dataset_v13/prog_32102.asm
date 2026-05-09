; DESCRIPTION: Renders a white line between points (396, 34) and (455, 171).
; PLAN: r0=396(x1), r1=34(y1), r2=455(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 34
LDI r2, 455
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
