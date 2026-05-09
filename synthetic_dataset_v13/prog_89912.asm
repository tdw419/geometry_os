; DESCRIPTION: Renders a red line between points (1, 69) and (428, 138).
; PLAN: r0=1(x1), r1=69(y1), r2=428(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 69
LDI r2, 428
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
