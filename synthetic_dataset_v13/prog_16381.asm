; DESCRIPTION: Renders a cyan disk with center (229, 159) and radius 28.
; PLAN: r0=229(x), r1=159(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 159
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
