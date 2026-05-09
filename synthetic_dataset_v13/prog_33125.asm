; DESCRIPTION: Renders a yellow box of size 74x36 starting at (0, 179).
; PLAN: r0=0(x), r1=179(y), r2=74(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 179
LDI r2, 74
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
