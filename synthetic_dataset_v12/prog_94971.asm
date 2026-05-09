; DESCRIPTION: Renders a white line between points (509, 138) and (132, 204).
; PLAN: r0=509(x1), r1=138(y1), r2=132(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 138
LDI r2, 132
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
