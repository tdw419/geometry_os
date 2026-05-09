; DESCRIPTION: Renders a magenta box of size 120x26 starting at (181, 36).
; PLAN: r0=181(x), r1=36(y), r2=120(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 36
LDI r2, 120
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
