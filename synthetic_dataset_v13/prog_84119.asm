; DESCRIPTION: Renders a cyan disk with center (178, 164) and radius 61.
; PLAN: r0=178(x), r1=164(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 164
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
