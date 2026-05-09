; DESCRIPTION: Renders a magenta box of size 63x47 starting at (25, 6).
; PLAN: r0=25(x), r1=6(y), r2=63(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 6
LDI r2, 63
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
