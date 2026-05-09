; DESCRIPTION: Renders a green line between points (233, 225) and (285, 149).
; PLAN: r0=233(x1), r1=225(y1), r2=285(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 225
LDI r2, 285
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
