; DESCRIPTION: Renders a black box of size 85x110 starting at (344, 45).
; PLAN: r0=344(x), r1=45(y), r2=85(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 45
LDI r2, 85
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
