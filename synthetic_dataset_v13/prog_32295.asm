; DESCRIPTION: Renders a green box of size 115x75 starting at (265, 9).
; PLAN: r0=265(x), r1=9(y), r2=115(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 9
LDI r2, 115
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
