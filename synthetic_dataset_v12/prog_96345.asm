; DESCRIPTION: Renders a green box of size 25x26 starting at (416, 18).
; PLAN: r0=416(x), r1=18(y), r2=25(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 18
LDI r2, 25
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
