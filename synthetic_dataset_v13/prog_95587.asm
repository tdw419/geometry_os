; DESCRIPTION: Renders a white line between points (123, 113) and (444, 170).
; PLAN: r0=123(x1), r1=113(y1), r2=444(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 113
LDI r2, 444
LDI r3, 170
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
