; DESCRIPTION: Renders a blue box of size 102x88 starting at (272, 161).
; PLAN: r0=272(x), r1=161(y), r2=102(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 161
LDI r2, 102
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
