; DESCRIPTION: Renders a green box of size 76x46 starting at (138, 149).
; PLAN: r0=138(x), r1=149(y), r2=76(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 149
LDI r2, 76
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
