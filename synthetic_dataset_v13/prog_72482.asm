; DESCRIPTION: Renders a white line between points (319, 180) and (285, 62).
; PLAN: r0=319(x1), r1=180(y1), r2=285(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 180
LDI r2, 285
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
