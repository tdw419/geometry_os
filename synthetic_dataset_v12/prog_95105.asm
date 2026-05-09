; DESCRIPTION: Renders a green box of size 76x62 starting at (76, 90).
; PLAN: r0=76(x), r1=90(y), r2=76(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 90
LDI r2, 76
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
