; DESCRIPTION: Renders a black box of size 57x26 starting at (268, 62).
; PLAN: r0=268(x), r1=62(y), r2=57(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 62
LDI r2, 57
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
