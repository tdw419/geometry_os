; DESCRIPTION: Renders a blue box of size 91x83 starting at (259, 173).
; PLAN: r0=259(x), r1=173(y), r2=91(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 173
LDI r2, 91
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
