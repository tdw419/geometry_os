; DESCRIPTION: Renders a green box of size 69x18 starting at (133, 224).
; PLAN: r0=133(x), r1=224(y), r2=69(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 224
LDI r2, 69
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
