; DESCRIPTION: Renders a white line between points (264, 112) and (254, 224).
; PLAN: r0=264(x1), r1=112(y1), r2=254(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 112
LDI r2, 254
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
