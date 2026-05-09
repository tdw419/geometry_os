; DESCRIPTION: Renders a red line between points (300, 54) and (244, 152).
; PLAN: r0=300(x1), r1=54(y1), r2=244(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 54
LDI r2, 244
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
