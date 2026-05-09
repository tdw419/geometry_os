; DESCRIPTION: Renders a white line between points (390, 36) and (214, 187).
; PLAN: r0=390(x1), r1=36(y1), r2=214(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 36
LDI r2, 214
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
