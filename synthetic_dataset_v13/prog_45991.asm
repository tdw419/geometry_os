; DESCRIPTION: Renders a magenta box of size 16x66 starting at (13, 58).
; PLAN: r0=13(x), r1=58(y), r2=16(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 58
LDI r2, 16
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
