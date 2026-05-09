; DESCRIPTION: Renders a green box of size 28x114 starting at (395, 1).
; PLAN: r0=395(x), r1=1(y), r2=28(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 1
LDI r2, 28
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
