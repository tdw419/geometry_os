; DESCRIPTION: Renders a purple box of size 80x26 starting at (344, 137).
; PLAN: r0=344(x), r1=137(y), r2=80(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 137
LDI r2, 80
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
