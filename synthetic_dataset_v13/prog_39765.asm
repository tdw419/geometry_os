; DESCRIPTION: Renders a yellow disk with center (197, 97) and radius 68.
; PLAN: r0=197(x), r1=97(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 97
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
