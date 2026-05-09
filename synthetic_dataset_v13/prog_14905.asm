; DESCRIPTION: Renders a white box of size 40x94 starting at (257, 23).
; PLAN: r0=257(x), r1=23(y), r2=40(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 23
LDI r2, 40
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
