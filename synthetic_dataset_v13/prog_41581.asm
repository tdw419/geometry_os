; DESCRIPTION: Renders a yellow line between points (286, 87) and (413, 142).
; PLAN: r0=286(x1), r1=87(y1), r2=413(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 87
LDI r2, 413
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
