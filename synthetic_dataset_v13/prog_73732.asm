; DESCRIPTION: Renders a magenta box of size 76x17 starting at (233, 103).
; PLAN: r0=233(x), r1=103(y), r2=76(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 103
LDI r2, 76
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
