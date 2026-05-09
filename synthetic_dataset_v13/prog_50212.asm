; DESCRIPTION: Renders a yellow disk with center (408, 83) and radius 67.
; PLAN: r0=408(x), r1=83(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 83
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
