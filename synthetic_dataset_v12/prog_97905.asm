; DESCRIPTION: Renders a red box of size 103x107 starting at (257, 7).
; PLAN: r0=257(x), r1=7(y), r2=103(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 7
LDI r2, 103
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
