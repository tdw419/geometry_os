; DESCRIPTION: Renders a black box of size 90x14 starting at (344, 212).
; PLAN: r0=344(x), r1=212(y), r2=90(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 212
LDI r2, 90
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
