; DESCRIPTION: Renders a black box of size 111x15 starting at (53, 201).
; PLAN: r0=53(x), r1=201(y), r2=111(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 201
LDI r2, 111
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
