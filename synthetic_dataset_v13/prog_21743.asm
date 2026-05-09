; DESCRIPTION: Renders a black box of size 104x101 starting at (161, 13).
; PLAN: r0=161(x), r1=13(y), r2=104(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 13
LDI r2, 104
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
