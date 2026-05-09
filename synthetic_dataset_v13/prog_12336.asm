; DESCRIPTION: Renders a green box of size 35x57 starting at (261, 43).
; PLAN: r0=261(x), r1=43(y), r2=35(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 43
LDI r2, 35
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
