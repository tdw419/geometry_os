; DESCRIPTION: Renders a yellow disk with center (182, 167) and radius 42.
; PLAN: r0=182(x), r1=167(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 167
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
