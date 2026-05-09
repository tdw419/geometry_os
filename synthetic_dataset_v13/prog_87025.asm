; DESCRIPTION: Renders a white line between points (286, 194) and (83, 225).
; PLAN: r0=286(x1), r1=194(y1), r2=83(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 194
LDI r2, 83
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
