; DESCRIPTION: Renders a black box of size 23x25 starting at (249, 49).
; PLAN: r0=249(x), r1=49(y), r2=23(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 49
LDI r2, 23
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
