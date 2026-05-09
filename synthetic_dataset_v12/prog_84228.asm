; DESCRIPTION: Renders a black box of size 15x99 starting at (148, 104).
; PLAN: r0=148(x), r1=104(y), r2=15(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 104
LDI r2, 15
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
