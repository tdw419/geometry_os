; DESCRIPTION: Renders a blue line between points (487, 138) and (348, 183).
; PLAN: r0=487(x1), r1=138(y1), r2=348(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 138
LDI r2, 348
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
