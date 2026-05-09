; DESCRIPTION: Renders a cyan disk with center (414, 50) and radius 49.
; PLAN: r0=414(x), r1=50(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 50
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
