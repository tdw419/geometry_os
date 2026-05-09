; DESCRIPTION: Renders a blue line between points (29, 233) and (285, 126).
; PLAN: r0=29(x1), r1=233(y1), r2=285(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 233
LDI r2, 285
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
