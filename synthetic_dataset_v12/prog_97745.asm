; DESCRIPTION: Renders a magenta box of size 49x98 starting at (28, 92).
; PLAN: r0=28(x), r1=92(y), r2=49(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 92
LDI r2, 49
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
