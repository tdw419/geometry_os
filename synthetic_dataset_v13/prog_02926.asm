; DESCRIPTION: Renders a green line between points (441, 107) and (214, 81).
; PLAN: r0=441(x1), r1=107(y1), r2=214(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 107
LDI r2, 214
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
