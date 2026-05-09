; DESCRIPTION: Renders a white line between points (33, 178) and (444, 84).
; PLAN: r0=33(x1), r1=178(y1), r2=444(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 178
LDI r2, 444
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
