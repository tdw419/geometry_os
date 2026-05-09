; DESCRIPTION: Renders a green box of size 18x37 starting at (334, 176).
; PLAN: r0=334(x), r1=176(y), r2=18(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 176
LDI r2, 18
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
