; DESCRIPTION: Renders a yellow box of size 101x44 starting at (382, 165).
; PLAN: r0=382(x), r1=165(y), r2=101(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 165
LDI r2, 101
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
