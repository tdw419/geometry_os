; DESCRIPTION: Renders a red disk with center (460, 195) and radius 36.
; PLAN: r0=460(x), r1=195(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 195
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
