; DESCRIPTION: Renders a green box of size 73x53 starting at (358, 184).
; PLAN: r0=358(x), r1=184(y), r2=73(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 184
LDI r2, 73
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
