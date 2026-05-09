; DESCRIPTION: Renders a white line between points (184, 175) and (236, 131).
; PLAN: r0=184(x1), r1=175(y1), r2=236(x2), r3=131(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 175
LDI r2, 236
LDI r3, 131
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
