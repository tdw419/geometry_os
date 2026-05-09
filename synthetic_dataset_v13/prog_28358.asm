; DESCRIPTION: Renders a cyan disk with center (326, 131) and radius 37.
; PLAN: r0=326(x), r1=131(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 131
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
