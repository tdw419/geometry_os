; DESCRIPTION: Renders a cyan disk with center (196, 78) and radius 13.
; PLAN: r0=196(x), r1=78(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 78
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
