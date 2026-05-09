; DESCRIPTION: Renders a magenta box of size 85x44 starting at (45, 64).
; PLAN: r0=45(x), r1=64(y), r2=85(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 64
LDI r2, 85
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
