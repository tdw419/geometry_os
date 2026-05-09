; DESCRIPTION: Renders a green box of size 65x85 starting at (344, 58).
; PLAN: r0=344(x), r1=58(y), r2=65(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 58
LDI r2, 65
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
