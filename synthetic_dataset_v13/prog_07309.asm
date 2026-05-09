; DESCRIPTION: Renders a blue line between points (487, 170) and (332, 170).
; PLAN: r0=487(x1), r1=170(y1), r2=332(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 170
LDI r2, 332
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
