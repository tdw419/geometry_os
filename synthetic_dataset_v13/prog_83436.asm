; DESCRIPTION: Renders a blue box of size 47x92 starting at (54, 101).
; PLAN: r0=54(x), r1=101(y), r2=47(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 101
LDI r2, 47
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
