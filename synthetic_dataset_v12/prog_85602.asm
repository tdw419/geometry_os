; DESCRIPTION: Renders a cyan disk with center (40, 108) and radius 33.
; PLAN: r0=40(x), r1=108(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 108
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
