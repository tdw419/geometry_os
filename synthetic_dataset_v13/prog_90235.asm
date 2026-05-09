; DESCRIPTION: Renders a white box of size 39x119 starting at (257, 135).
; PLAN: r0=257(x), r1=135(y), r2=39(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 135
LDI r2, 39
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
