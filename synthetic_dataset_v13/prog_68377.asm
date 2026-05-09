; DESCRIPTION: Renders a cyan disk with center (209, 177) and radius 72.
; PLAN: r0=209(x), r1=177(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 177
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
