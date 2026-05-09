; DESCRIPTION: Renders a black box of size 104x118 starting at (291, 8).
; PLAN: r0=291(x), r1=8(y), r2=104(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 8
LDI r2, 104
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
