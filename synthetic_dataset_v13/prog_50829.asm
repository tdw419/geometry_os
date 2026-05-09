; DESCRIPTION: Renders a green box of size 118x31 starting at (257, 107).
; PLAN: r0=257(x), r1=107(y), r2=118(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 107
LDI r2, 118
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
