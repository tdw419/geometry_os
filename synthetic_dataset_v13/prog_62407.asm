; DESCRIPTION: Renders a green box of size 29x38 starting at (128, 140).
; PLAN: r0=128(x), r1=140(y), r2=29(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 140
LDI r2, 29
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
