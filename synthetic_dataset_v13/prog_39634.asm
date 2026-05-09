; DESCRIPTION: Renders a yellow box of size 88x74 starting at (141, 172).
; PLAN: r0=141(x), r1=172(y), r2=88(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 172
LDI r2, 88
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
