; DESCRIPTION: Renders a white line between points (95, 160) and (148, 225).
; PLAN: r0=95(x1), r1=160(y1), r2=148(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 160
LDI r2, 148
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
