; DESCRIPTION: Renders a green box of size 60x37 starting at (344, 24).
; PLAN: r0=344(x), r1=24(y), r2=60(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 24
LDI r2, 60
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
