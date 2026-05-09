; DESCRIPTION: Renders a cyan disk with center (337, 114) and radius 72.
; PLAN: r0=337(x), r1=114(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 114
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
