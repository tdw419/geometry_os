; DESCRIPTION: Renders a magenta box of size 78x55 starting at (203, 60).
; PLAN: r0=203(x), r1=60(y), r2=78(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 60
LDI r2, 78
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
