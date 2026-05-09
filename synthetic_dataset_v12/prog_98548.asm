; DESCRIPTION: Renders a green box of size 74x26 starting at (178, 163).
; PLAN: r0=178(x), r1=163(y), r2=74(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 163
LDI r2, 74
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
