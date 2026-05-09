; DESCRIPTION: Renders a magenta box of size 107x60 starting at (122, 12).
; PLAN: r0=122(x), r1=12(y), r2=107(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 12
LDI r2, 107
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
