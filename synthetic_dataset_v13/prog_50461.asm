; DESCRIPTION: Renders a blue box of size 68x107 starting at (272, 53).
; PLAN: r0=272(x), r1=53(y), r2=68(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 53
LDI r2, 68
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
