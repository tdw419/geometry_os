; DESCRIPTION: Renders a purple box of size 75x76 starting at (344, 72).
; PLAN: r0=344(x), r1=72(y), r2=75(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 72
LDI r2, 75
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
