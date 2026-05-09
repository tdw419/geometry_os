; DESCRIPTION: Renders a yellow box of size 76x61 starting at (148, 62).
; PLAN: r0=148(x), r1=62(y), r2=76(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 62
LDI r2, 76
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
