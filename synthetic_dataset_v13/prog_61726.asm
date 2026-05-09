; DESCRIPTION: Renders a white line between points (28, 222) and (37, 73).
; PLAN: r0=28(x1), r1=222(y1), r2=37(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 222
LDI r2, 37
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
