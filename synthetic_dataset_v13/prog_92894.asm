; DESCRIPTION: Renders a cyan line between points (369, 49) and (81, 81).
; PLAN: r0=369(x1), r1=49(y1), r2=81(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 49
LDI r2, 81
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
