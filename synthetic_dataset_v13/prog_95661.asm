; DESCRIPTION: Renders a magenta box of size 103x36 starting at (35, 43).
; PLAN: r0=35(x), r1=43(y), r2=103(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 43
LDI r2, 103
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
