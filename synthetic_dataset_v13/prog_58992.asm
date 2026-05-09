; DESCRIPTION: Renders a yellow disk with center (400, 206) and radius 23.
; PLAN: r0=400(x), r1=206(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 206
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
