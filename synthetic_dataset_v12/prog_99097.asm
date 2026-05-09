; DESCRIPTION: Renders a white line between points (474, 102) and (129, 42).
; PLAN: r0=474(x1), r1=102(y1), r2=129(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 102
LDI r2, 129
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
