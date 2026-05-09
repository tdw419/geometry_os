; DESCRIPTION: Renders a yellow box of size 85x106 starting at (108, 64).
; PLAN: r0=108(x), r1=64(y), r2=85(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 64
LDI r2, 85
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
