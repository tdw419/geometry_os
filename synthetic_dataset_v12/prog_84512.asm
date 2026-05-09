; DESCRIPTION: Renders a magenta box of size 26x93 starting at (90, 103).
; PLAN: r0=90(x), r1=103(y), r2=26(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 103
LDI r2, 26
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
