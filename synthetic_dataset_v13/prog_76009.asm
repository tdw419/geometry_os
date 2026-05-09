; DESCRIPTION: Renders a yellow line between points (103, 163) and (245, 120).
; PLAN: r0=103(x1), r1=163(y1), r2=245(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 163
LDI r2, 245
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
