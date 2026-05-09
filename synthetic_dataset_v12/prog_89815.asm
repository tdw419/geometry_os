; DESCRIPTION: Renders a magenta box of size 83x48 starting at (6, 71).
; PLAN: r0=6(x), r1=71(y), r2=83(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 71
LDI r2, 83
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
