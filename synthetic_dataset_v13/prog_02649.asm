; DESCRIPTION: Renders a magenta box of size 29x28 starting at (482, 18).
; PLAN: r0=482(x), r1=18(y), r2=29(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 18
LDI r2, 29
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
