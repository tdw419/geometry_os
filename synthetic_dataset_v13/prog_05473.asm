; DESCRIPTION: Renders a green box of size 76x119 starting at (86, 16).
; PLAN: r0=86(x), r1=16(y), r2=76(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 16
LDI r2, 76
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
