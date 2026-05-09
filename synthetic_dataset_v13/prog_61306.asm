; DESCRIPTION: Renders a white box of size 44x40 starting at (257, 96).
; PLAN: r0=257(x), r1=96(y), r2=44(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 96
LDI r2, 44
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
