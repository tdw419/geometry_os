; DESCRIPTION: Renders a green box of size 28x113 starting at (101, 102).
; PLAN: r0=101(x), r1=102(y), r2=28(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 102
LDI r2, 28
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
