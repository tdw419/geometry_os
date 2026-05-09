; DESCRIPTION: Renders a magenta box of size 16x23 starting at (414, 172).
; PLAN: r0=414(x), r1=172(y), r2=16(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 172
LDI r2, 16
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
