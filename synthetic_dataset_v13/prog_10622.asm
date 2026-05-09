; DESCRIPTION: Renders a cyan disk with center (279, 177) and radius 35.
; PLAN: r0=279(x), r1=177(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 177
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
