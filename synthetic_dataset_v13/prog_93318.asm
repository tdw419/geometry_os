; DESCRIPTION: Renders a yellow line between points (369, 93) and (496, 27).
; PLAN: r0=369(x1), r1=93(y1), r2=496(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 93
LDI r2, 496
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
