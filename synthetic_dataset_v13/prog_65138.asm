; DESCRIPTION: Renders a magenta box of size 71x95 starting at (99, 7).
; PLAN: r0=99(x), r1=7(y), r2=71(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 7
LDI r2, 71
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
