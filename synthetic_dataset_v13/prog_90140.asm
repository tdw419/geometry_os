; DESCRIPTION: Renders a red line between points (431, 56) and (346, 100).
; PLAN: r0=431(x1), r1=56(y1), r2=346(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 56
LDI r2, 346
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
