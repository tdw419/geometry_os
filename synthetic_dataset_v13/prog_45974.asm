; DESCRIPTION: Renders a blue box of size 102x22 starting at (364, 83).
; PLAN: r0=364(x), r1=83(y), r2=102(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 83
LDI r2, 102
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
