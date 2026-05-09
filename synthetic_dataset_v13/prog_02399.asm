; DESCRIPTION: Renders a green line between points (134, 28) and (233, 219).
; PLAN: r0=134(x1), r1=28(y1), r2=233(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 28
LDI r2, 233
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
