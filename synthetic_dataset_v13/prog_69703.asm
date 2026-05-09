; DESCRIPTION: Draws a red line from (142, 170) to (464, 109).
; PLAN: r0=142(x1), r1=170(y1), r2=464(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 170
LDI r2, 464
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
