; DESCRIPTION: Renders a black box of size 30x83 starting at (175, 123).
; PLAN: r0=175(x), r1=123(y), r2=30(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 123
LDI r2, 30
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
