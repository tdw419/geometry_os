; DESCRIPTION: Renders a blue box of size 73x17 starting at (338, 38).
; PLAN: r0=338(x), r1=38(y), r2=73(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 38
LDI r2, 73
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
