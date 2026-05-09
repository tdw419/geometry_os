; DESCRIPTION: Renders a magenta box of size 87x59 starting at (60, 34).
; PLAN: r0=60(x), r1=34(y), r2=87(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 34
LDI r2, 87
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
