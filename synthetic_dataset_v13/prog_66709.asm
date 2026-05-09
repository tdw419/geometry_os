; DESCRIPTION: Renders a yellow line between points (375, 141) and (226, 59).
; PLAN: r0=375(x1), r1=141(y1), r2=226(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 141
LDI r2, 226
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
