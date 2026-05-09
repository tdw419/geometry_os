; DESCRIPTION: Renders a cyan box of size 118x10 starting at (390, 43).
; PLAN: r0=390(x), r1=43(y), r2=118(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 43
LDI r2, 118
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
