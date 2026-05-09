; DESCRIPTION: Renders a black box of size 93x61 starting at (53, 38).
; PLAN: r0=53(x), r1=38(y), r2=93(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 38
LDI r2, 93
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
