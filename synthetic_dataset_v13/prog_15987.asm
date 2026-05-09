; DESCRIPTION: Renders a purple box of size 74x87 starting at (7, 153).
; PLAN: r0=7(x), r1=153(y), r2=74(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 153
LDI r2, 74
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
