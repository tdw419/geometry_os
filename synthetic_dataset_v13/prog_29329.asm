; DESCRIPTION: Renders a yellow line between points (262, 181) and (454, 143).
; PLAN: r0=262(x1), r1=181(y1), r2=454(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 181
LDI r2, 454
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
