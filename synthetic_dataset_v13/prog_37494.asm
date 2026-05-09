; DESCRIPTION: Renders a green box of size 113x20 starting at (56, 69).
; PLAN: r0=56(x), r1=69(y), r2=113(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 69
LDI r2, 113
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
