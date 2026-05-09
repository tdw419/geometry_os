; DESCRIPTION: Renders a black box of size 96x23 starting at (216, 66).
; PLAN: r0=216(x), r1=66(y), r2=96(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 66
LDI r2, 96
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
