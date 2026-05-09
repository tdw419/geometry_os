; DESCRIPTION: Renders a cyan disk with center (178, 134) and radius 72.
; PLAN: r0=178(x), r1=134(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 134
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
