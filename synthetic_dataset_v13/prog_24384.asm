; DESCRIPTION: Renders a red line between points (221, 29) and (285, 142).
; PLAN: r0=221(x1), r1=29(y1), r2=285(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 29
LDI r2, 285
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
