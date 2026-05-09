; DESCRIPTION: Renders a yellow box of size 58x14 starting at (360, 56).
; PLAN: r0=360(x), r1=56(y), r2=58(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 56
LDI r2, 58
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
