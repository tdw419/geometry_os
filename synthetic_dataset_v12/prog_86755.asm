; DESCRIPTION: Renders a green box of size 57x76 starting at (375, 123).
; PLAN: r0=375(x), r1=123(y), r2=57(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 123
LDI r2, 57
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
