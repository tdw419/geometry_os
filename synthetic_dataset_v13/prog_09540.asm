; DESCRIPTION: Renders a yellow box of size 32x23 starting at (381, 230).
; PLAN: r0=381(x), r1=230(y), r2=32(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 230
LDI r2, 32
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
