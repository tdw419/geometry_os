; DESCRIPTION: Renders a white line between points (175, 46) and (421, 233).
; PLAN: r0=175(x1), r1=46(y1), r2=421(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 46
LDI r2, 421
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
