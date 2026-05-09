; DESCRIPTION: Renders a red line between points (392, 200) and (103, 145).
; PLAN: r0=392(x1), r1=200(y1), r2=103(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 200
LDI r2, 103
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
