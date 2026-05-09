; DESCRIPTION: Renders a red disk with center (307, 198) and radius 34.
; PLAN: r0=307(x), r1=198(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 198
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
