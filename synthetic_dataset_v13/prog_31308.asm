; DESCRIPTION: Renders a magenta box of size 13x55 starting at (332, 194).
; PLAN: r0=332(x), r1=194(y), r2=13(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 194
LDI r2, 13
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
