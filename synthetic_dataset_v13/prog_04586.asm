; DESCRIPTION: Renders a white box of size 22x11 starting at (206, 224).
; PLAN: r0=206(x), r1=224(y), r2=22(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 224
LDI r2, 22
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
