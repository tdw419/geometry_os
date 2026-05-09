; DESCRIPTION: Renders a white line between points (2, 208) and (110, 224).
; PLAN: r0=2(x1), r1=208(y1), r2=110(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 208
LDI r2, 110
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
