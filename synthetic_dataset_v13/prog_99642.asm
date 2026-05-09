; DESCRIPTION: Renders a yellow line between points (320, 78) and (320, 104).
; PLAN: r0=320(x1), r1=78(y1), r2=320(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 78
LDI r2, 320
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
