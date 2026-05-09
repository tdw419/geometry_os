; DESCRIPTION: Renders a cyan disk with center (452, 237) and radius 16.
; PLAN: r0=452(x), r1=237(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 237
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
