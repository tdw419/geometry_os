; DESCRIPTION: Renders a magenta box of size 10x10 starting at (458, 23).
; PLAN: r0=458(x), r1=23(y), r2=10(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 23
LDI r2, 10
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
