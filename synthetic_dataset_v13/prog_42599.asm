; DESCRIPTION: Renders a black box of size 76x65 starting at (40, 30).
; PLAN: r0=40(x), r1=30(y), r2=76(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 30
LDI r2, 76
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
