; DESCRIPTION: Renders a magenta box of size 115x48 starting at (76, 22).
; PLAN: r0=76(x), r1=22(y), r2=115(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 22
LDI r2, 115
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
