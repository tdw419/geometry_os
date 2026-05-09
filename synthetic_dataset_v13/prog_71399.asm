; DESCRIPTION: Renders a yellow line between points (320, 175) and (233, 84).
; PLAN: r0=320(x1), r1=175(y1), r2=233(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 175
LDI r2, 233
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
