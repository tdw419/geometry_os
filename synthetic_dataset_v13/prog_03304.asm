; DESCRIPTION: Renders a white line between points (71, 253) and (92, 52).
; PLAN: r0=71(x1), r1=253(y1), r2=92(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 253
LDI r2, 92
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
