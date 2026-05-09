; DESCRIPTION: Renders a magenta box of size 85x55 starting at (64, 61).
; PLAN: r0=64(x), r1=61(y), r2=85(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 61
LDI r2, 85
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
