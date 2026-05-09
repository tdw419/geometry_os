; DESCRIPTION: Renders a black box of size 22x39 starting at (65, 12).
; PLAN: r0=65(x), r1=12(y), r2=22(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 12
LDI r2, 22
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
