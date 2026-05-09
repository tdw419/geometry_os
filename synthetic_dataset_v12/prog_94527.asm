; DESCRIPTION: Renders a cyan disk with center (412, 78) and radius 28.
; PLAN: r0=412(x), r1=78(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 78
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
