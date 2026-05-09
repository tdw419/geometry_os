; DESCRIPTION: Renders a white line between points (82, 2) and (99, 60).
; PLAN: r0=82(x1), r1=2(y1), r2=99(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 2
LDI r2, 99
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
