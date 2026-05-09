; DESCRIPTION: Renders a red line between points (487, 135) and (83, 165).
; PLAN: r0=487(x1), r1=135(y1), r2=83(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 135
LDI r2, 83
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
