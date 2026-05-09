; DESCRIPTION: Renders a red disk with center (156, 177) and radius 64.
; PLAN: r0=156(x), r1=177(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 177
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
