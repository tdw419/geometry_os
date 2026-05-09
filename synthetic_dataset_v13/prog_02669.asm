; DESCRIPTION: Places a orange circle of radius 71 at center (104, 169).
; PLAN: r0=104(x), r1=169(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 169
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
