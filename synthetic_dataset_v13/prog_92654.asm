; DESCRIPTION: Places a blue circle of radius 68 at center (174, 72).
; PLAN: r0=174(x), r1=72(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 72
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
