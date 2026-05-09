; DESCRIPTION: Renders a red line between points (338, 43) and (264, 224).
; PLAN: r0=338(x1), r1=43(y1), r2=264(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 43
LDI r2, 264
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
