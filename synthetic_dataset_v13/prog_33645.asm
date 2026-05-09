; DESCRIPTION: Renders a black box of size 95x53 starting at (185, 201).
; PLAN: r0=185(x), r1=201(y), r2=95(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 201
LDI r2, 95
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
