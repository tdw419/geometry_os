; DESCRIPTION: Renders a yellow line between points (295, 51) and (226, 153).
; PLAN: r0=295(x1), r1=51(y1), r2=226(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 51
LDI r2, 226
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
