; DESCRIPTION: Places a yellow line segment connecting (148, 125) to (303, 253).
; PLAN: r0=148(x1), r1=125(y1), r2=303(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 125
LDI r2, 303
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
