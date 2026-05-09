; DESCRIPTION: Renders a black box of size 40x28 starting at (416, 70).
; PLAN: r0=416(x), r1=70(y), r2=40(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 70
LDI r2, 40
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
