; DESCRIPTION: Renders a white line between points (366, 32) and (233, 22).
; PLAN: r0=366(x1), r1=32(y1), r2=233(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 32
LDI r2, 233
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
