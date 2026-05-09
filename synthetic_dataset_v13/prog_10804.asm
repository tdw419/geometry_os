; DESCRIPTION: Renders a black box of size 81x10 starting at (224, 222).
; PLAN: r0=224(x), r1=222(y), r2=81(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 222
LDI r2, 81
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
