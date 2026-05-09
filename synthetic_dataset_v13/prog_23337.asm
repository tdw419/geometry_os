; DESCRIPTION: Renders a black box of size 110x70 starting at (212, 166).
; PLAN: r0=212(x), r1=166(y), r2=110(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 166
LDI r2, 110
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
