; DESCRIPTION: Renders a cyan disk with center (329, 91) and radius 10.
; PLAN: r0=329(x), r1=91(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 91
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
