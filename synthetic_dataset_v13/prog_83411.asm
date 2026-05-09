; DESCRIPTION: Renders a yellow disk with center (387, 97) and radius 35.
; PLAN: r0=387(x), r1=97(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 97
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
