; DESCRIPTION: Renders a red line between points (313, 199) and (484, 59).
; PLAN: r0=313(x1), r1=199(y1), r2=484(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 199
LDI r2, 484
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
