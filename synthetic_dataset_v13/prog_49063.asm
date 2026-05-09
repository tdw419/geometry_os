; DESCRIPTION: Renders a blue box of size 112x39 starting at (252, 166).
; PLAN: r0=252(x), r1=166(y), r2=112(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 166
LDI r2, 112
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
