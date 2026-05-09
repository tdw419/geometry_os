; DESCRIPTION: Renders a yellow line between points (396, 189) and (425, 33).
; PLAN: r0=396(x1), r1=189(y1), r2=425(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 189
LDI r2, 425
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
