; DESCRIPTION: Renders a magenta box of size 101x68 starting at (263, 10).
; PLAN: r0=263(x), r1=10(y), r2=101(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 10
LDI r2, 101
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
