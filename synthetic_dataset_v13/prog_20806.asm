; DESCRIPTION: Renders a purple box of size 16x14 starting at (452, 37).
; PLAN: r0=452(x), r1=37(y), r2=16(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 37
LDI r2, 16
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
