; DESCRIPTION: Renders a magenta box of size 12x76 starting at (67, 44).
; PLAN: r0=67(x), r1=44(y), r2=12(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 44
LDI r2, 12
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
