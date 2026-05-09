; DESCRIPTION: Renders a white line between points (203, 115) and (143, 48).
; PLAN: r0=203(x1), r1=115(y1), r2=143(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 115
LDI r2, 143
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
