; DESCRIPTION: Renders a magenta box of size 92x63 starting at (293, 85).
; PLAN: r0=293(x), r1=85(y), r2=92(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 85
LDI r2, 92
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
