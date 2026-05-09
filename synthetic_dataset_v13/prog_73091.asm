; DESCRIPTION: Renders a magenta box of size 115x23 starting at (90, 32).
; PLAN: r0=90(x), r1=32(y), r2=115(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 32
LDI r2, 115
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
