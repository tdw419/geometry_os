; DESCRIPTION: Renders a cyan disk with center (107, 154) and radius 73.
; PLAN: r0=107(x), r1=154(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 154
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
