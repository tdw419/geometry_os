; DESCRIPTION: Renders a red disk with center (328, 114) and radius 61.
; PLAN: r0=328(x), r1=114(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 114
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
