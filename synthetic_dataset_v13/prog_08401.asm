; DESCRIPTION: Renders a purple box of size 100x15 starting at (231, 187).
; PLAN: r0=231(x), r1=187(y), r2=100(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 187
LDI r2, 100
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
