; DESCRIPTION: Renders a white line between points (20, 248) and (259, 204).
; PLAN: r0=20(x1), r1=248(y1), r2=259(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 248
LDI r2, 259
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
