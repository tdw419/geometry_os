; DESCRIPTION: Renders a red line between points (487, 13) and (1, 110).
; PLAN: r0=487(x1), r1=13(y1), r2=1(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 13
LDI r2, 1
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
