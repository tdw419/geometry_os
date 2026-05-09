; DESCRIPTION: Renders a white line between points (366, 31) and (47, 174).
; PLAN: r0=366(x1), r1=31(y1), r2=47(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 31
LDI r2, 47
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
