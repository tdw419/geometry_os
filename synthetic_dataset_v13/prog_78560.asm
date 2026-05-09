; DESCRIPTION: Renders a purple box of size 47x101 starting at (120, 28).
; PLAN: r0=120(x), r1=28(y), r2=47(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 28
LDI r2, 47
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
