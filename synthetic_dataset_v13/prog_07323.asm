; DESCRIPTION: Renders a black box of size 70x25 starting at (76, 3).
; PLAN: r0=76(x), r1=3(y), r2=70(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 3
LDI r2, 70
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
