; DESCRIPTION: Renders a magenta box of size 93x95 starting at (19, 50).
; PLAN: r0=19(x), r1=50(y), r2=93(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 50
LDI r2, 93
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
