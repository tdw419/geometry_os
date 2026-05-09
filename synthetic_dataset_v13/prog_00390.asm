; DESCRIPTION: Renders a purple box of size 86x78 starting at (241, 162).
; PLAN: r0=241(x), r1=162(y), r2=86(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 162
LDI r2, 86
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
