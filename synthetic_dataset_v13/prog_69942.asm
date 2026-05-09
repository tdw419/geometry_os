; DESCRIPTION: Renders a white line between points (120, 88) and (324, 254).
; PLAN: r0=120(x1), r1=88(y1), r2=324(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 88
LDI r2, 324
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
