; DESCRIPTION: Renders a green box of size 39x58 starting at (442, 102).
; PLAN: r0=442(x), r1=102(y), r2=39(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 102
LDI r2, 39
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
