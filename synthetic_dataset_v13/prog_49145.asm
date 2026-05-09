; DESCRIPTION: Places a red line segment connecting (487, 51) to (435, 17).
; PLAN: r0=487(x1), r1=51(y1), r2=435(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 51
LDI r2, 435
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
