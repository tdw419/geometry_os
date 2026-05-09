; DESCRIPTION: Renders a green line between points (442, 177) and (293, 165).
; PLAN: r0=442(x1), r1=177(y1), r2=293(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 177
LDI r2, 293
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
