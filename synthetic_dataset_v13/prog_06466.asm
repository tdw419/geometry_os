; DESCRIPTION: Renders a cyan disk with center (437, 114) and radius 44.
; PLAN: r0=437(x), r1=114(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 114
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
