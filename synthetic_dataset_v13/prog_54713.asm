; DESCRIPTION: Renders a purple box of size 95x67 starting at (278, 92).
; PLAN: r0=278(x), r1=92(y), r2=95(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 92
LDI r2, 95
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
