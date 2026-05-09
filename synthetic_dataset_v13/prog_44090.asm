; DESCRIPTION: Renders a purple box of size 96x59 starting at (312, 12).
; PLAN: r0=312(x), r1=12(y), r2=96(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 12
LDI r2, 96
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
