; DESCRIPTION: Renders a blue box of size 33x14 starting at (76, 143).
; PLAN: r0=76(x), r1=143(y), r2=33(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 143
LDI r2, 33
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
