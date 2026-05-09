; DESCRIPTION: Renders a yellow box of size 32x84 starting at (274, 61).
; PLAN: r0=274(x), r1=61(y), r2=32(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 61
LDI r2, 32
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
