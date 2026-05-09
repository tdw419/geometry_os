; DESCRIPTION: Renders a black box of size 40x65 starting at (153, 23).
; PLAN: r0=153(x), r1=23(y), r2=40(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 23
LDI r2, 40
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
