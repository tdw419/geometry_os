; DESCRIPTION: Renders a magenta box of size 62x76 starting at (203, 178).
; PLAN: r0=203(x), r1=178(y), r2=62(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 178
LDI r2, 62
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
