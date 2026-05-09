; DESCRIPTION: Renders a red disk with center (236, 202) and radius 49.
; PLAN: r0=236(x), r1=202(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 202
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
