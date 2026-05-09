; DESCRIPTION: Renders a white line between points (6, 153) and (32, 120).
; PLAN: r0=6(x1), r1=153(y1), r2=32(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 153
LDI r2, 32
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
