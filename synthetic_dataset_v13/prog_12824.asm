; DESCRIPTION: Renders a white line between points (283, 13) and (506, 14).
; PLAN: r0=283(x1), r1=13(y1), r2=506(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 13
LDI r2, 506
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
