; DESCRIPTION: Renders a green disk with center (395, 111) and radius 18.
; PLAN: r0=395(x), r1=111(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 111
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
