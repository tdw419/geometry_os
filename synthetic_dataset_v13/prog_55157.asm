; DESCRIPTION: Renders a black box of size 95x40 starting at (285, 62).
; PLAN: r0=285(x), r1=62(y), r2=95(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 62
LDI r2, 95
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
