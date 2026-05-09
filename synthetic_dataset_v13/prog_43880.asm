; DESCRIPTION: Renders a red line between points (48, 54) and (19, 226).
; PLAN: r0=48(x1), r1=54(y1), r2=19(x2), r3=226(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 54
LDI r2, 19
LDI r3, 226
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
