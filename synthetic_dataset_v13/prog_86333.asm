; DESCRIPTION: Renders a red disk with center (236, 154) and radius 19.
; PLAN: r0=236(x), r1=154(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 154
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
