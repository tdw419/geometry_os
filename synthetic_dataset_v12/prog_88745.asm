; DESCRIPTION: Renders a cyan disk with center (449, 163) and radius 48.
; PLAN: r0=449(x), r1=163(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 163
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
