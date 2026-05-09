; DESCRIPTION: Renders a magenta box of size 37x19 starting at (458, 183).
; PLAN: r0=458(x), r1=183(y), r2=37(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 183
LDI r2, 37
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
