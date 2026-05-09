; DESCRIPTION: Renders a white line between points (178, 29) and (466, 208).
; PLAN: r0=178(x1), r1=29(y1), r2=466(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 29
LDI r2, 466
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
