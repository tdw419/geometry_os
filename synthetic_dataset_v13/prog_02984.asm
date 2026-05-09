; DESCRIPTION: Renders a green line between points (354, 227) and (241, 237).
; PLAN: r0=354(x1), r1=227(y1), r2=241(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 227
LDI r2, 241
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
