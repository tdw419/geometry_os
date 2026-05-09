; DESCRIPTION: Renders a yellow box of size 15x101 starting at (492, 113).
; PLAN: r0=492(x), r1=113(y), r2=15(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 113
LDI r2, 15
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
