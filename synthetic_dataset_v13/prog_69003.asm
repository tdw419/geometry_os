; DESCRIPTION: Renders a red line between points (40, 87) and (313, 152).
; PLAN: r0=40(x1), r1=87(y1), r2=313(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 87
LDI r2, 313
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
