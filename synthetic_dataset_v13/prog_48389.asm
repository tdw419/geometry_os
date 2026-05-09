; DESCRIPTION: Renders a black box of size 119x32 starting at (265, 44).
; PLAN: r0=265(x), r1=44(y), r2=119(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 44
LDI r2, 119
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
