; DESCRIPTION: Renders a magenta box of size 76x85 starting at (144, 83).
; PLAN: r0=144(x), r1=83(y), r2=76(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 83
LDI r2, 76
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
