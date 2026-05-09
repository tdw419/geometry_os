; DESCRIPTION: Renders a white line between points (101, 5) and (387, 84).
; PLAN: r0=101(x1), r1=5(y1), r2=387(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 5
LDI r2, 387
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
