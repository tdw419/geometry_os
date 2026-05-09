; DESCRIPTION: Renders a yellow disk with center (197, 206) and radius 43.
; PLAN: r0=197(x), r1=206(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 206
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
