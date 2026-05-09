; DESCRIPTION: Renders a purple box of size 22x30 starting at (205, 31).
; PLAN: r0=205(x), r1=31(y), r2=22(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 31
LDI r2, 22
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
