; DESCRIPTION: Renders a black box of size 34x83 starting at (184, 37).
; PLAN: r0=184(x), r1=37(y), r2=34(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 37
LDI r2, 34
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
