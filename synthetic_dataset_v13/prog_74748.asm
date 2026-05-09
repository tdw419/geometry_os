; DESCRIPTION: Renders a yellow box of size 76x105 starting at (435, 6).
; PLAN: r0=435(x), r1=6(y), r2=76(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 6
LDI r2, 76
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
