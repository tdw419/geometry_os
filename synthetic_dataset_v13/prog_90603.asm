; DESCRIPTION: Renders a white line between points (403, 223) and (369, 191).
; PLAN: r0=403(x1), r1=223(y1), r2=369(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 223
LDI r2, 369
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
