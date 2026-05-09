; DESCRIPTION: Renders a black box of size 40x113 starting at (69, 136).
; PLAN: r0=69(x), r1=136(y), r2=40(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 136
LDI r2, 40
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
