; DESCRIPTION: Renders a white line between points (317, 65) and (202, 116).
; PLAN: r0=317(x1), r1=65(y1), r2=202(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 65
LDI r2, 202
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
