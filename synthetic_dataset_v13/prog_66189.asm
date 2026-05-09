; DESCRIPTION: Renders a green box of size 53x78 starting at (395, 40).
; PLAN: r0=395(x), r1=40(y), r2=53(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 40
LDI r2, 53
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
