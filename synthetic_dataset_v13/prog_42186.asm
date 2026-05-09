; DESCRIPTION: Renders a magenta box of size 63x50 starting at (48, 148).
; PLAN: r0=48(x), r1=148(y), r2=63(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 148
LDI r2, 63
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
