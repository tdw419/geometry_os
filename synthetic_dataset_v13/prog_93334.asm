; DESCRIPTION: Renders a magenta box of size 48x107 starting at (338, 73).
; PLAN: r0=338(x), r1=73(y), r2=48(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 73
LDI r2, 48
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
