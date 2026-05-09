; DESCRIPTION: Renders a white line between points (285, 20) and (230, 100).
; PLAN: r0=285(x1), r1=20(y1), r2=230(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 20
LDI r2, 230
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
