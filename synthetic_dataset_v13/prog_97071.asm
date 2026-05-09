; DESCRIPTION: Renders a cyan disk with center (279, 122) and radius 29.
; PLAN: r0=279(x), r1=122(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 122
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
