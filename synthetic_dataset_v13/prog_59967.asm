; DESCRIPTION: Renders a white box of size 55x65 starting at (257, 128).
; PLAN: r0=257(x), r1=128(y), r2=55(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 128
LDI r2, 55
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
