; DESCRIPTION: Renders a white line between points (324, 33) and (388, 177).
; PLAN: r0=324(x1), r1=33(y1), r2=388(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 33
LDI r2, 388
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
