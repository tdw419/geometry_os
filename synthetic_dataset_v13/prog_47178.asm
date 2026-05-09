; DESCRIPTION: Renders a purple box of size 34x95 starting at (291, 98).
; PLAN: r0=291(x), r1=98(y), r2=34(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 98
LDI r2, 34
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
