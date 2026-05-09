; DESCRIPTION: Renders a red disk with center (247, 128) and radius 59.
; PLAN: r0=247(x), r1=128(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 128
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
