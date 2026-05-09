; DESCRIPTION: Renders a white line between points (474, 225) and (58, 169).
; PLAN: r0=474(x1), r1=225(y1), r2=58(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 225
LDI r2, 58
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
