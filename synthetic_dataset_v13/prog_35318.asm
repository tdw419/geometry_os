; DESCRIPTION: Renders a blue box of size 66x95 starting at (254, 34).
; PLAN: r0=254(x), r1=34(y), r2=66(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 34
LDI r2, 66
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
