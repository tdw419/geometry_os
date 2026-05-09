; DESCRIPTION: Renders a magenta box of size 13x53 starting at (36, 68).
; PLAN: r0=36(x), r1=68(y), r2=13(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 68
LDI r2, 13
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
