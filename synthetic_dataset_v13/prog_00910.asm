; DESCRIPTION: Renders a black box of size 15x81 starting at (269, 104).
; PLAN: r0=269(x), r1=104(y), r2=15(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 104
LDI r2, 15
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
