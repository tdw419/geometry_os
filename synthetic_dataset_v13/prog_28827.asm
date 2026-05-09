; DESCRIPTION: Renders a cyan disk with center (246, 60) and radius 23.
; PLAN: r0=246(x), r1=60(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 60
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
