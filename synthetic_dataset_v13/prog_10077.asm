; DESCRIPTION: Renders a yellow box of size 37x114 starting at (209, 9).
; PLAN: r0=209(x), r1=9(y), r2=37(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 9
LDI r2, 37
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
