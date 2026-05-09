; DESCRIPTION: Renders a green box of size 64x114 starting at (237, 137).
; PLAN: r0=237(x), r1=137(y), r2=64(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 137
LDI r2, 64
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
