; DESCRIPTION: Renders a yellow box of size 30x17 starting at (167, 219).
; PLAN: r0=167(x), r1=219(y), r2=30(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 219
LDI r2, 30
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
