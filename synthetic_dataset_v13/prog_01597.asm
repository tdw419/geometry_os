; DESCRIPTION: Renders a green box of size 64x12 starting at (71, 69).
; PLAN: r0=71(x), r1=69(y), r2=64(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 69
LDI r2, 64
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
