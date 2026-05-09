; DESCRIPTION: Renders a black box of size 76x82 starting at (57, 142).
; PLAN: r0=57(x), r1=142(y), r2=76(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 142
LDI r2, 76
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
