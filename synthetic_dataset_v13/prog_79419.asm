; DESCRIPTION: Renders a purple box of size 15x115 starting at (252, 6).
; PLAN: r0=252(x), r1=6(y), r2=15(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 6
LDI r2, 15
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
