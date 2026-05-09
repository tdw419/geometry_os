; DESCRIPTION: Renders a cyan disk with center (407, 54) and radius 32.
; PLAN: r0=407(x), r1=54(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 54
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
