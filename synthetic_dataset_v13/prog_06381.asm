; DESCRIPTION: Renders a magenta box of size 34x22 starting at (457, 153).
; PLAN: r0=457(x), r1=153(y), r2=34(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 153
LDI r2, 34
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
