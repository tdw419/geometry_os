; DESCRIPTION: Renders a white line between points (232, 205) and (64, 22).
; PLAN: r0=232(x1), r1=205(y1), r2=64(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 205
LDI r2, 64
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
