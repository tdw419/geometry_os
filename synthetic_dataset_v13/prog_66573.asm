; DESCRIPTION: Renders a white line between points (294, 218) and (297, 196).
; PLAN: r0=294(x1), r1=218(y1), r2=297(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 218
LDI r2, 297
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
