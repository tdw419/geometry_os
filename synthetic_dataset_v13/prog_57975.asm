; DESCRIPTION: Renders a black box of size 115x120 starting at (122, 24).
; PLAN: r0=122(x), r1=24(y), r2=115(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 24
LDI r2, 115
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
