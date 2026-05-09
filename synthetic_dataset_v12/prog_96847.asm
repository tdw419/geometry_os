; DESCRIPTION: Renders a yellow disk with center (446, 206) and radius 26.
; PLAN: r0=446(x), r1=206(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 206
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
