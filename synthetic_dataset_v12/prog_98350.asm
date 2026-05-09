; DESCRIPTION: Renders a red disk with center (242, 151) and radius 79.
; PLAN: r0=242(x), r1=151(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 151
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
