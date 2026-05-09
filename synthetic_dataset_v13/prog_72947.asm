; DESCRIPTION: Renders a red disk with center (366, 128) and radius 35.
; PLAN: r0=366(x), r1=128(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 128
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
