; DESCRIPTION: Renders a white box of size 19x35 starting at (390, 160).
; PLAN: r0=390(x), r1=160(y), r2=19(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 160
LDI r2, 19
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
