; DESCRIPTION: Renders a magenta box of size 55x19 starting at (194, 108).
; PLAN: r0=194(x), r1=108(y), r2=55(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 108
LDI r2, 55
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
