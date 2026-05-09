; DESCRIPTION: Places a yellow circle of radius 68 at center (178, 90).
; PLAN: r0=178(x), r1=90(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 90
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
