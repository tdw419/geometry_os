; DESCRIPTION: Renders a white line between points (214, 181) and (162, 224).
; PLAN: r0=214(x1), r1=181(y1), r2=162(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 181
LDI r2, 162
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
