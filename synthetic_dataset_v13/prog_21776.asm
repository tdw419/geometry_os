; DESCRIPTION: Renders a red line between points (312, 33) and (495, 108).
; PLAN: r0=312(x1), r1=33(y1), r2=495(x2), r3=108(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 33
LDI r2, 495
LDI r3, 108
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
