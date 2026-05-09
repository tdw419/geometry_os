; DESCRIPTION: Renders a green box of size 76x100 starting at (149, 156).
; PLAN: r0=149(x), r1=156(y), r2=76(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 156
LDI r2, 76
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
