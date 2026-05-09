; DESCRIPTION: Renders a white line between points (77, 194) and (29, 86).
; PLAN: r0=77(x1), r1=194(y1), r2=29(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 194
LDI r2, 29
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
