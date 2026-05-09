; DESCRIPTION: Renders a black box of size 17x117 starting at (90, 106).
; PLAN: r0=90(x), r1=106(y), r2=17(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 106
LDI r2, 17
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
