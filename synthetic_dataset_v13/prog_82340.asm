; DESCRIPTION: Renders a magenta box of size 63x14 starting at (120, 24).
; PLAN: r0=120(x), r1=24(y), r2=63(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 24
LDI r2, 63
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
