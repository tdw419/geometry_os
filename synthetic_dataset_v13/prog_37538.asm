; DESCRIPTION: Renders a purple box of size 30x107 starting at (74, 92).
; PLAN: r0=74(x), r1=92(y), r2=30(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 92
LDI r2, 30
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
