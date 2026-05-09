; DESCRIPTION: Renders a red disk with center (239, 28) and radius 17.
; PLAN: r0=239(x), r1=28(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 28
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
