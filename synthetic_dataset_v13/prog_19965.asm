; DESCRIPTION: Renders a yellow box of size 26x36 starting at (285, 13).
; PLAN: r0=285(x), r1=13(y), r2=26(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 13
LDI r2, 26
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
