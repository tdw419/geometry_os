; DESCRIPTION: Renders a blue box of size 115x108 starting at (166, 83).
; PLAN: r0=166(x), r1=83(y), r2=115(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 83
LDI r2, 115
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
