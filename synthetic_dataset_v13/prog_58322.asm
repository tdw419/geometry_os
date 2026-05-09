; DESCRIPTION: Renders a white line between points (142, 96) and (156, 6).
; PLAN: r0=142(x1), r1=96(y1), r2=156(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 96
LDI r2, 156
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
