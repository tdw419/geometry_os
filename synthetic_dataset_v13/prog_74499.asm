; DESCRIPTION: Renders a magenta box of size 53x66 starting at (27, 182).
; PLAN: r0=27(x), r1=182(y), r2=53(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 182
LDI r2, 53
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
