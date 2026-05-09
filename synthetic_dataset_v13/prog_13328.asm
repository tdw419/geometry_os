; DESCRIPTION: Renders a white line between points (505, 183) and (444, 46).
; PLAN: r0=505(x1), r1=183(y1), r2=444(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 183
LDI r2, 444
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
