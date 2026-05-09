; DESCRIPTION: Renders a magenta box of size 32x75 starting at (126, 140).
; PLAN: r0=126(x), r1=140(y), r2=32(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 140
LDI r2, 32
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
