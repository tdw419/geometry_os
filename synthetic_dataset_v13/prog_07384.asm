; DESCRIPTION: Renders a blue box of size 48x95 starting at (257, 143).
; PLAN: r0=257(x), r1=143(y), r2=48(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 143
LDI r2, 48
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
