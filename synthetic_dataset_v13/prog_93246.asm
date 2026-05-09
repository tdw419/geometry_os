; DESCRIPTION: Renders a purple box of size 54x101 starting at (180, 68).
; PLAN: r0=180(x), r1=68(y), r2=54(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 68
LDI r2, 54
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
