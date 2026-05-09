; DESCRIPTION: Renders a yellow line between points (148, 165) and (103, 203).
; PLAN: r0=148(x1), r1=165(y1), r2=103(x2), r3=203(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 165
LDI r2, 103
LDI r3, 203
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
