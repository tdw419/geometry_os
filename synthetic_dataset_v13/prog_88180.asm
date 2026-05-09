; DESCRIPTION: Renders a purple box of size 14x62 starting at (458, 47).
; PLAN: r0=458(x), r1=47(y), r2=14(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 47
LDI r2, 14
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
