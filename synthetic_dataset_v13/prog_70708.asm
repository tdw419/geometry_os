; DESCRIPTION: Renders a white line between points (162, 199) and (90, 148).
; PLAN: r0=162(x1), r1=199(y1), r2=90(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 199
LDI r2, 90
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
