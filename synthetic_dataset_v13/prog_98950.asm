; DESCRIPTION: Renders a black box of size 111x53 starting at (326, 189).
; PLAN: r0=326(x), r1=189(y), r2=111(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 189
LDI r2, 111
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
