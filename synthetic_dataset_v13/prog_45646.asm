; DESCRIPTION: Places a red line segment connecting (87, 121) to (448, 29).
; PLAN: r0=87(x1), r1=121(y1), r2=448(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 121
LDI r2, 448
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
