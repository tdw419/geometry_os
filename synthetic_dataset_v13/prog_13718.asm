; DESCRIPTION: Renders a black box of size 40x117 starting at (175, 35).
; PLAN: r0=175(x), r1=35(y), r2=40(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 35
LDI r2, 40
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
