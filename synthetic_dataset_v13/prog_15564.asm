; DESCRIPTION: Renders a purple box of size 38x62 starting at (74, 91).
; PLAN: r0=74(x), r1=91(y), r2=38(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 91
LDI r2, 38
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
