; DESCRIPTION: Renders a white line between points (165, 12) and (462, 48).
; PLAN: r0=165(x1), r1=12(y1), r2=462(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 12
LDI r2, 462
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
