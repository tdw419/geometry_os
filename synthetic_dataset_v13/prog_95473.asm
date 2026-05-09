; DESCRIPTION: Renders a magenta box of size 26x50 starting at (241, 14).
; PLAN: r0=241(x), r1=14(y), r2=26(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 14
LDI r2, 26
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
