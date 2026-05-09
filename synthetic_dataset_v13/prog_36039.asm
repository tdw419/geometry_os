; DESCRIPTION: Places a cyan line segment connecting (109, 29) to (441, 112).
; PLAN: r0=109(x1), r1=29(y1), r2=441(x2), r3=112(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 29
LDI r2, 441
LDI r3, 112
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
