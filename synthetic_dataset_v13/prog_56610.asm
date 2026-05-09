; DESCRIPTION: Renders a cyan disk with center (473, 64) and radius 33.
; PLAN: r0=473(x), r1=64(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 473
LDI r1, 64
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
