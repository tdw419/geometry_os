; DESCRIPTION: Renders a yellow line between points (226, 86) and (123, 174).
; PLAN: r0=226(x1), r1=86(y1), r2=123(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 86
LDI r2, 123
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
