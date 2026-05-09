; DESCRIPTION: Renders a white line between points (507, 204) and (441, 56).
; PLAN: r0=507(x1), r1=204(y1), r2=441(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 204
LDI r2, 441
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
