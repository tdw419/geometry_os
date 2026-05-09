; DESCRIPTION: Renders a magenta box of size 97x103 starting at (140, 64).
; PLAN: r0=140(x), r1=64(y), r2=97(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 64
LDI r2, 97
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
