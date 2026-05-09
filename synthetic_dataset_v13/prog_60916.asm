; DESCRIPTION: Renders a cyan disk with center (402, 91) and radius 49.
; PLAN: r0=402(x), r1=91(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 91
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
