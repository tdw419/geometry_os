; DESCRIPTION: Renders a yellow disk with center (401, 80) and radius 18.
; PLAN: r0=401(x), r1=80(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 80
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
