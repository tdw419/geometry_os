; DESCRIPTION: Renders a green box of size 88x49 starting at (122, 113).
; PLAN: r0=122(x), r1=113(y), r2=88(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 113
LDI r2, 88
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
