; DESCRIPTION: Renders a magenta box of size 54x116 starting at (62, 10).
; PLAN: r0=62(x), r1=10(y), r2=54(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 10
LDI r2, 54
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
