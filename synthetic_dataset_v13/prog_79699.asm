; DESCRIPTION: Renders a green box of size 11x13 starting at (344, 45).
; PLAN: r0=344(x), r1=45(y), r2=11(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 45
LDI r2, 11
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
