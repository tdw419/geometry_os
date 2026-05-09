; DESCRIPTION: Renders a red line between points (91, 135) and (299, 200).
; PLAN: r0=91(x1), r1=135(y1), r2=299(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 135
LDI r2, 299
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
