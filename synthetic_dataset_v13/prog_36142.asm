; DESCRIPTION: Renders a green box of size 32x67 starting at (318, 35).
; PLAN: r0=318(x), r1=35(y), r2=32(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 35
LDI r2, 32
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
