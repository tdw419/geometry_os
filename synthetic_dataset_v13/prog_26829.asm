; DESCRIPTION: Renders a magenta box of size 70x12 starting at (29, 26).
; PLAN: r0=29(x), r1=26(y), r2=70(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 26
LDI r2, 70
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
