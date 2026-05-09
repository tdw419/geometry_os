; DESCRIPTION: Renders a orange line between points (506, 162) and (308, 209).
; PLAN: r0=506(x1), r1=162(y1), r2=308(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 162
LDI r2, 308
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
