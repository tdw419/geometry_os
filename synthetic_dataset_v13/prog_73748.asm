; DESCRIPTION: Renders a magenta box of size 76x65 starting at (430, 148).
; PLAN: r0=430(x), r1=148(y), r2=76(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 148
LDI r2, 76
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
