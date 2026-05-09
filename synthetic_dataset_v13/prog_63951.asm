; DESCRIPTION: Renders a magenta box of size 71x100 starting at (181, 14).
; PLAN: r0=181(x), r1=14(y), r2=71(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 14
LDI r2, 71
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
