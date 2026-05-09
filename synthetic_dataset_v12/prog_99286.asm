; DESCRIPTION: Renders a black box of size 73x115 starting at (416, 24).
; PLAN: r0=416(x), r1=24(y), r2=73(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 24
LDI r2, 73
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
