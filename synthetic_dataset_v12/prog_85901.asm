; DESCRIPTION: Renders a blue box of size 18x61 starting at (26, 92).
; PLAN: r0=26(x), r1=92(y), r2=18(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 92
LDI r2, 18
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
