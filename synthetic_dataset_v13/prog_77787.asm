; DESCRIPTION: Renders a magenta box of size 98x24 starting at (145, 184).
; PLAN: r0=145(x), r1=184(y), r2=98(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 184
LDI r2, 98
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
