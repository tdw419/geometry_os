; DESCRIPTION: Renders a green line between points (20, 70) and (285, 226).
; PLAN: r0=20(x1), r1=70(y1), r2=285(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 70
LDI r2, 285
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
