; DESCRIPTION: Renders a cyan box of size 85x114 starting at (155, 139).
; PLAN: r0=155(x), r1=139(y), r2=85(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 139
LDI r2, 85
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
