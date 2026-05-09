; DESCRIPTION: Renders a magenta box of size 55x101 starting at (135, 90).
; PLAN: r0=135(x), r1=90(y), r2=55(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 90
LDI r2, 55
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
