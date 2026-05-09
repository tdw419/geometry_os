; DESCRIPTION: Renders a red line between points (407, 1) and (428, 193).
; PLAN: r0=407(x1), r1=1(y1), r2=428(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 1
LDI r2, 428
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
