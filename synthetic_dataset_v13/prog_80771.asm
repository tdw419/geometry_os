; DESCRIPTION: Renders a purple line between points (487, 131) and (415, 76).
; PLAN: r0=487(x1), r1=131(y1), r2=415(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 131
LDI r2, 415
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
