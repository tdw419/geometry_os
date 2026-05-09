; DESCRIPTION: Renders a cyan disk with center (239, 114) and radius 11.
; PLAN: r0=239(x), r1=114(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 114
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
