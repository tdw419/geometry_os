; DESCRIPTION: Renders a magenta box of size 12x43 starting at (180, 1).
; PLAN: r0=180(x), r1=1(y), r2=12(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 1
LDI r2, 12
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
