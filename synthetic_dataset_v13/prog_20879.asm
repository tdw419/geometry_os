; DESCRIPTION: Renders a cyan disk with center (151, 46) and radius 18.
; PLAN: r0=151(x), r1=46(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 46
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
