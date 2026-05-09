; DESCRIPTION: Renders a white box of size 105x53 starting at (294, 24).
; PLAN: r0=294(x), r1=24(y), r2=105(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 24
LDI r2, 105
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
