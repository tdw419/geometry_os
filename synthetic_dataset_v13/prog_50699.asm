; DESCRIPTION: Renders a white line between points (462, 115) and (144, 32).
; PLAN: r0=462(x1), r1=115(y1), r2=144(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 115
LDI r2, 144
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
