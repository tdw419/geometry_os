; DESCRIPTION: Renders a black line between points (61, 162) and (399, 225).
; PLAN: r0=61(x1), r1=162(y1), r2=399(x2), r3=225(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 162
LDI r2, 399
LDI r3, 225
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
