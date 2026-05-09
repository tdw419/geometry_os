; DESCRIPTION: Renders a black line between points (52, 153) and (168, 74).
; PLAN: r0=52(x1), r1=153(y1), r2=168(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 153
LDI r2, 168
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
