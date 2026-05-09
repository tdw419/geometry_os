; DESCRIPTION: Renders a red disk with center (242, 100) and radius 64.
; PLAN: r0=242(x), r1=100(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 100
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
