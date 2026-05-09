; DESCRIPTION: Renders a magenta box of size 28x96 starting at (34, 47).
; PLAN: r0=34(x), r1=47(y), r2=28(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 47
LDI r2, 28
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
