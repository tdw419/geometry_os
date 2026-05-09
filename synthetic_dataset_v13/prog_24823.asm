; DESCRIPTION: Renders a purple box of size 78x62 starting at (70, 167).
; PLAN: r0=70(x), r1=167(y), r2=78(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 167
LDI r2, 78
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
