; DESCRIPTION: Renders a yellow disk with center (59, 206) and radius 22.
; PLAN: r0=59(x), r1=206(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 206
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
