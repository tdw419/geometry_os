; DESCRIPTION: Renders a black box of size 20x13 starting at (249, 31).
; PLAN: r0=249(x), r1=31(y), r2=20(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 31
LDI r2, 20
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
