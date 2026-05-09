; DESCRIPTION: Renders a white line between points (219, 212) and (262, 149).
; PLAN: r0=219(x1), r1=212(y1), r2=262(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 212
LDI r2, 262
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
