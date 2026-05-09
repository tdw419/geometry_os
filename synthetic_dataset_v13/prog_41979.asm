; DESCRIPTION: Renders a purple disk with center (242, 167) and radius 46.
; PLAN: r0=242(x), r1=167(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 167
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
