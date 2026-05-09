; DESCRIPTION: Renders a black box of size 66x117 starting at (29, 25).
; PLAN: r0=29(x), r1=25(y), r2=66(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 25
LDI r2, 66
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
