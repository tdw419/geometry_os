; DESCRIPTION: Renders a yellow line between points (441, 199) and (166, 134).
; PLAN: r0=441(x1), r1=199(y1), r2=166(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 199
LDI r2, 166
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
