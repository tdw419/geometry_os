; DESCRIPTION: Renders a green box of size 91x108 starting at (238, 72).
; PLAN: r0=238(x), r1=72(y), r2=91(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 72
LDI r2, 91
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
