; DESCRIPTION: Renders a white line between points (222, 126) and (435, 133).
; PLAN: r0=222(x1), r1=126(y1), r2=435(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 126
LDI r2, 435
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
