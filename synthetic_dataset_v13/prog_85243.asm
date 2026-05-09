; DESCRIPTION: Renders a yellow disk with center (285, 187) and radius 50.
; PLAN: r0=285(x), r1=187(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 187
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
