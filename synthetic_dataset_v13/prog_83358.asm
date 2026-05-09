; DESCRIPTION: Renders a green box of size 32x61 starting at (477, 155).
; PLAN: r0=477(x), r1=155(y), r2=32(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 155
LDI r2, 32
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
