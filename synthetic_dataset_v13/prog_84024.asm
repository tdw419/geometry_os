; DESCRIPTION: Places a yellow circle of radius 46 at center (213, 109).
; PLAN: r0=213(x), r1=109(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 109
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
