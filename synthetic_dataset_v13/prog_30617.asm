; DESCRIPTION: Renders a red line between points (476, 134) and (487, 200).
; PLAN: r0=476(x1), r1=134(y1), r2=487(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 134
LDI r2, 487
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
