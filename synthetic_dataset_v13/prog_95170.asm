; DESCRIPTION: Renders a magenta box of size 12x25 starting at (182, 184).
; PLAN: r0=182(x), r1=184(y), r2=12(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 184
LDI r2, 12
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
