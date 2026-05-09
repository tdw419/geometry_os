; DESCRIPTION: Renders a magenta box of size 115x82 starting at (111, 38).
; PLAN: r0=111(x), r1=38(y), r2=115(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 38
LDI r2, 115
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
