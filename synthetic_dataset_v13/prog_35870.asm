; DESCRIPTION: Renders a cyan disk with center (21, 85) and radius 15.
; PLAN: r0=21(x), r1=85(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 21
LDI r1, 85
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
