; DESCRIPTION: Renders a black box of size 45x107 starting at (86, 63).
; PLAN: r0=86(x), r1=63(y), r2=45(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 63
LDI r2, 45
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
