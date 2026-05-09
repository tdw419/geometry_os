; DESCRIPTION: Renders a yellow box of size 64x22 starting at (338, 176).
; PLAN: r0=338(x), r1=176(y), r2=64(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 176
LDI r2, 64
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
