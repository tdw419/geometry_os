; DESCRIPTION: Renders a magenta box of size 59x10 starting at (362, 245).
; PLAN: r0=362(x), r1=245(y), r2=59(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 245
LDI r2, 59
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
