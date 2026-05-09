; DESCRIPTION: Renders a white line between points (144, 116) and (419, 169).
; PLAN: r0=144(x1), r1=116(y1), r2=419(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 116
LDI r2, 419
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
