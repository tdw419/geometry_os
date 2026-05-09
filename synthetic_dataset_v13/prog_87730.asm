; DESCRIPTION: Renders a cyan disk with center (368, 172) and radius 49.
; PLAN: r0=368(x), r1=172(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 172
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
