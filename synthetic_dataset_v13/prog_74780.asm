; DESCRIPTION: Renders a white line between points (55, 109) and (210, 120).
; PLAN: r0=55(x1), r1=109(y1), r2=210(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 109
LDI r2, 210
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
