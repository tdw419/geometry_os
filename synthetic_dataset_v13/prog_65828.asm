; DESCRIPTION: Renders a white line between points (275, 209) and (366, 201).
; PLAN: r0=275(x1), r1=209(y1), r2=366(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 209
LDI r2, 366
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
