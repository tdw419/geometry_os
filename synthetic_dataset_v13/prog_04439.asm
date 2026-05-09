; DESCRIPTION: Renders a white line between points (509, 26) and (151, 214).
; PLAN: r0=509(x1), r1=26(y1), r2=151(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 26
LDI r2, 151
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
