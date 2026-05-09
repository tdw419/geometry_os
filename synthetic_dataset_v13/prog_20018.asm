; DESCRIPTION: Renders a cyan disk with center (251, 150) and radius 28.
; PLAN: r0=251(x), r1=150(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 150
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
