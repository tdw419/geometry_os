; DESCRIPTION: Renders a green box of size 29x35 starting at (333, 85).
; PLAN: r0=333(x), r1=85(y), r2=29(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 85
LDI r2, 29
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
