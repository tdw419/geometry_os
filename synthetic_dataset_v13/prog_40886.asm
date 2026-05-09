; DESCRIPTION: Renders a blue box of size 76x27 starting at (215, 88).
; PLAN: r0=215(x), r1=88(y), r2=76(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 88
LDI r2, 76
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
