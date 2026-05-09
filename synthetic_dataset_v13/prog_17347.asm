; DESCRIPTION: Renders a red disk with center (361, 39) and radius 32.
; PLAN: r0=361(x), r1=39(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 39
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
