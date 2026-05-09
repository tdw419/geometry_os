; DESCRIPTION: Renders a yellow box of size 68x29 starting at (324, 224).
; PLAN: r0=324(x), r1=224(y), r2=68(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 224
LDI r2, 68
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
