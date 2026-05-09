; DESCRIPTION: Renders a magenta box of size 76x29 starting at (409, 153).
; PLAN: r0=409(x), r1=153(y), r2=76(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 153
LDI r2, 76
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
