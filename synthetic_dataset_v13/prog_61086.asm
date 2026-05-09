; DESCRIPTION: Renders a white line between points (6, 172) and (275, 40).
; PLAN: r0=6(x1), r1=172(y1), r2=275(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 172
LDI r2, 275
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
