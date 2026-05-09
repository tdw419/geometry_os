; DESCRIPTION: Renders a green box of size 69x12 starting at (9, 24).
; PLAN: r0=9(x), r1=24(y), r2=69(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 24
LDI r2, 69
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
